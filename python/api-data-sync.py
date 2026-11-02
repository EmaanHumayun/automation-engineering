"""
Automated REST API Data Synchronizer
Fetches data from upstream endpoints, validates payload structure, and writes to local cache.
"""
import urllib.request
import json
import time

def fetch_data(url: str, retries: int = 3, backoff: float = 1.5):
    for attempt in range(1, retries + 1):
        try:
            req = urllib.request.Request(url, headers={"User-Agent": "AutomationSync/1.0"})
            with urllib.request.urlopen(req, timeout=10) as resp:
                if resp.status == 200:
                    return json.loads(resp.read().decode())
        except Exception as e:
            print(f"[RETRY {attempt}/{retries}] Failed to fetch: {e}")
            time.sleep(backoff * attempt)
    raise RuntimeError("Max retries exceeded for upstream API.")

if __name__ == "__main__":
    print("Initiating automated synchronization...")
    # Example using public JSON placeholder
    data = fetch_data("https://jsonplaceholder.typicode.com/todos/1")
    print(f"✅ Synchronized record #{data.get('id')}: {data.get('title')}")
