#!/usr/bin/env python3
"""DashScope(OpenAI 兼容) 客户端: 带磁盘缓存与并发, 供闭环实验复用。"""
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
    for k in ("LLM_API_KEY", "LLM_API_URL"):
        if os.environ.get(k):
            env[k] = os.environ[k]
    return env


ENV = load_env()
URL = ENV.get("LLM_API_URL", "https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions")
KEY = ENV.get("LLM_API_KEY", "")


def chat(prompt: str, *, model: str = "qwen-plus", system: str | None = None,
         temperature: float = 0.0, max_tokens: int = 4096, seed: int | None = 7,
         use_cache: bool = True, retries: int = 4) -> str:
    msgs = ([{"role": "system", "content": system}] if system else []) + \
           [{"role": "user", "content": prompt}]
    body = {"model": model, "messages": msgs, "temperature": temperature,
            "max_tokens": max_tokens}
    if seed is not None:
        body["seed"] = seed
    if model.startswith("qwen3"):
        body["enable_thinking"] = False

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
                              json=body, timeout=180)
            if r.status_code != 200:
                last = f"HTTP {r.status_code}: {r.text[:300]}"
                time.sleep(2 * (attempt + 1))
                continue
            content = r.json()["choices"][0]["message"]["content"]
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
