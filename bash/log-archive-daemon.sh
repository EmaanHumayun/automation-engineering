#!/usr/bin/env bash
# Automated Log Archival and Rotation Daemon
set -euo pipefail

SOURCE_DIR="${1:-/var/log}"
ARCHIVE_DIR="${2:-/var/log/archives}"
RETENTION_DAYS=7

mkdir -p "$ARCHIVE_DIR"
ARCHIVE_NAME="logs_$(date '+%Y%m%d_%H%M%S').tar.gz"

echo "Compressing logs from $SOURCE_DIR..."
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" --exclude="$ARCHIVE_DIR" -C "$SOURCE_DIR" . 2>/dev/null || true
echo "Archive created: $ARCHIVE_DIR/$ARCHIVE_NAME"

echo "Pruning archives older than $RETENTION_DAYS days..."
find "$ARCHIVE_DIR" -type f -name "logs_*.tar.gz" -mtime +"$RETENTION_DAYS" -delete
echo "Log rotation completed."
