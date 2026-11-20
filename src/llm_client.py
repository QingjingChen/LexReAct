#!/usr/bin/env python3
"""OpenAI 兼容的 chat/completions 客户端（DashScope、公司 LLM Center 等网关均可）：带磁盘缓存、并发与用量记录。

  .env:  LLM_API_URL=<网关的 .../v1/chat/completions>   LLM_API_KEY=<key>   LLM_MODEL=<默认模型>
  python src/llm_client.py --models            # 列出该 key 可用的模型
  python src/llm_client.py --ping "你好"        # 试调一次，打印回复与 token 用量
  python src/llm_client.py --usage             # 汇总已记录的 token 用量
"""
from __future__ import annotations

import hashlib
import json
import os
import threading
import time
from pathlib import Path

import requests

import sys
sys.path.insert(0, str(Path(__file__).resolve().parent))
from paths import ENV_FILE, LLM_CACHE as CACHE  # noqa: E402
CACHE.mkdir(parents=True, exist_ok=True)
_LOCK = threading.Lock()


def load_env() -> dict[str, str]:
    env = {}
    p = ENV_FILE
    if p.exists():
        for line in p.read_text(encoding="utf-8").splitlines():
            line = line.strip()
            if line and not line.startswith("#") and "=" in line:
                k, v = line.split("=", 1)
                env[k.strip()] = v.strip()
    for k in ("LLM_API_KEY", "LLM_API_URL", "LLM_MODEL", "LLM_TIMEOUT"):
        if os.environ.get(k):
            env[k] = os.environ[k]
    return env


ENV = load_env()
URL = ENV.get("LLM_API_URL", "https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions")
KEY = ENV.get("LLM_API_KEY", "")
MODEL = ENV.get("LLM_MODEL", "qwen-plus")
TIMEOUT = int(ENV.get("LLM_TIMEOUT", "600"))          # 思考模式的大请求可能超过 3 分钟
DASHSCOPE = "dashscope" in URL
USAGE = CACHE / "usage.jsonl"


def chat(prompt: str, *, model: str | None = None, system: str | None = None,
         temperature: float = 0.0, max_tokens: int = 4096, seed: int | None = 7,
         use_cache: bool = True, retries: int = 4, thinking: bool | None = None, tag: str = "") -> str:
    """thinking：None 沿用旧行为（DashScope 上的 qwen3 关闭思考）；True/False 显式开关（DashScope 用 enable_thinking，
    其他网关用 OpenAI 的 reasoning_effort，网关不支持时请保持 None）。tag 写入用量记录，便于按任务统计。"""
    model = model or MODEL
    msgs = ([{"role": "system", "content": system}] if system else []) + \
           [{"role": "user", "content": prompt}]
    body = {"model": model, "messages": msgs, "temperature": temperature,
            "max_tokens": max_tokens}
    if seed is not None:
        body["seed"] = seed
    if DASHSCOPE and model.startswith("qwen3"):
        body["enable_thinking"] = bool(thinking)
    elif thinking is not None and not DASHSCOPE:
        body["reasoning_effort"] = "high" if thinking else "low"

    key = hashlib.sha256(json.dumps(body, ensure_ascii=False, sort_keys=True).encode()).hexdigest()
    fp = CACHE / f"{key}.json"
    if use_cache and fp.exists():
        try:
            return json.loads(fp.read_text(encoding="utf-8"))["content"]
        except (json.JSONDecodeError, KeyError, OSError):
            fp.unlink(missing_ok=True)  # 半截文件, 丢弃重取

    last = None
    for attempt in range(retries):
        try:
            r = requests.post(URL, headers={"Authorization": f"Bearer {KEY}",
                                            "Content-Type": "application/json"},
                              json=body, timeout=TIMEOUT)
            if r.status_code != 200:
                last = f"HTTP {r.status_code}: {r.text[:300]}"
                time.sleep(2 * (attempt + 1))
                continue
            data = r.json()
            content = data["choices"][0]["message"]["content"]
            u = data.get("usage") or {}
            with _LOCK:
                with open(USAGE, "a", encoding="utf-8") as f:
                    f.write(json.dumps({"t": time.strftime("%Y-%m-%d %H:%M:%S"), "model": model, "tag": tag,
                                        "prompt": u.get("prompt_tokens"), "completion": u.get("completion_tokens"),
                                        "cached": (u.get("prompt_tokens_details") or {}).get("cached_tokens"),
                                        "reasoning": (u.get("completion_tokens_details") or {}).get("reasoning_tokens")}) + "\n")
            with _LOCK:  # 原子落盘: 先写临时文件再 rename, 避免并发读到半截 JSON
                tmp = fp.with_suffix(f".tmp{threading.get_ident()}")
                tmp.write_text(json.dumps({"body": body, "content": content},
                                          ensure_ascii=False), encoding="utf-8")
                tmp.replace(fp)
            return content
        except Exception as e:  # noqa: BLE001
            last = f"{type(e).__name__}: {e}"
            time.sleep(2 * (attempt + 1))
    raise RuntimeError(f"LLM call failed after {retries} tries: {last}")


def extract_json(text: str) -> dict:
    """从模型回复里抠出第一个完整 JSON 对象。"""
    t = text.strip()
    if "```" in t:
        parts = t.split("```")
        for p in parts:
            p = p.strip()
            if p.startswith("json"):
                p = p[4:].strip()
            if p.startswith("{"):
                t = p
                break
    start = t.find("{")
    if start < 0:
        raise ValueError(f"no JSON object in reply: {text[:200]}")
    depth, in_str, esc = 0, False, False
    for i, ch in enumerate(t[start:], start):
        if in_str:
            if esc:
                esc = False
            elif ch == "\\":
                esc = True
            elif ch == '"':
                in_str = False
            continue
        if ch == '"':
            in_str = True
        elif ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
            if depth == 0:
                return json.loads(t[start:i + 1])
    raise ValueError(f"unbalanced JSON: {text[:200]}")


def list_models() -> list[str]:
    base = URL.rsplit("/chat/completions", 1)[0]
    r = requests.get(f"{base}/models", headers={"Authorization": f"Bearer {KEY}"}, timeout=30)
    r.raise_for_status()
    return sorted(m["id"] for m in r.json().get("data", []))


def usage_summary(tag: str | None = None) -> dict:
    tot = {}
    if USAGE.exists():
        for line in USAGE.read_text(encoding="utf-8").splitlines():
            x = json.loads(line)
            if tag and x.get("tag") != tag:
                continue
            t = tot.setdefault(x["model"], {"calls": 0, "prompt": 0, "completion": 0, "cached": 0, "reasoning": 0})
            t["calls"] += 1
            for k in ("prompt", "completion", "cached", "reasoning"):
                t[k] += x.get(k) or 0
    return tot


if __name__ == "__main__":
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("--models", action="store_true")
    ap.add_argument("--ping")
    ap.add_argument("--model")
    ap.add_argument("--usage", action="store_true")
    a = ap.parse_args()
    if not KEY:
        sys.exit("未配置 LLM_API_KEY（见 .env.example）")
    print("endpoint:", URL)
    if a.models:
        print("\n".join(list_models()))
    if a.ping:
        print(chat(a.ping, model=a.model, use_cache=False, max_tokens=200, tag="ping"))
        print(json.loads(USAGE.read_text(encoding="utf-8").splitlines()[-1]))
    if a.usage:
        print(json.dumps(usage_summary(), ensure_ascii=False, indent=1))
