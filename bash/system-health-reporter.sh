#!/usr/bin/env bash
# Automated System Health Reporter
set -euo pipefail

LOG_FILE="/tmp/system_health.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$TIMESTAMP] === SYSTEM HEALTH REPORT ===" >> "$LOG_FILE"

# CPU Load
CPU_LOAD=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1 | tr -d ' ')
echo "[$TIMESTAMP] CPU Load (1m): $CPU_LOAD" >> "$LOG_FILE"

# Memory Check
MEM_FREE=$(free -m | awk '/Mem:/ { printf "%.2f", ($4+$6+$7)/$2 * 100 }')
echo "[$TIMESTAMP] Free Memory: $MEM_FREE%" >> "$LOG_FILE"

# Disk Usage
DISK_USAGE=$(df -h / | awk 'NR==2 { print $5 }' | tr -d '%')
echo "[$TIMESTAMP] Root Disk Usage: $DISK_USAGE%" >> "$LOG_FILE"

if [ "$DISK_USAGE" -gt 85 ]; then
    echo "[$TIMESTAMP] ⚠️ WARNING: Disk usage exceeded 85% ($DISK_USAGE%)" >> "$LOG_FILE"
fi

echo "[$TIMESTAMP] Health check finished successfully." >> "$LOG_FILE"
echo "Report appended to $LOG_FILE"
