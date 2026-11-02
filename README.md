# Automation & Integration Engineering

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Stack](https://img.shields.io/badge/Stack-Python%20%7C%20Bash%20%7C%20Cron-green.svg)](#)

A practical engineering repository containing automated system operations, Python data synchronization scripts, event-driven webhooks, and scheduled background daemons.

---

## 📂 Repository Contents

| Component | Language | Purpose | Key Script |
| :--- | :--- | :--- | :--- |
| **System Diagnostics** | Bash | Automated CPU, memory, and disk health auditing with threshold alerts | `bash/system-health-reporter.sh` |
| **Log Archival Daemon** | Bash | Automated log compression, rotation, and S3-ready timestamping | `bash/log-archive-daemon.sh` |
| **API Data Synchronizer** | Python | Robust REST API polling, error retry with exponential backoff, JSON transform | `python/api-data-sync.py` |
| **Webhook Receiver** | Python | Lightweight HTTP listener for third-party webhook ingestion and verification | `python/webhook-receiver.py` |

---

## 🚀 Quickstart & Execution

### 1. Run Health Reporter
```bash
chmod +x bash/*.sh
./bash/system-health-reporter.sh
```

### 2. Run API Sync Script
```bash
python3 python/api-data-sync.py
```
