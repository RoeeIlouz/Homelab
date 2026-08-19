#!/usr/bin/env bash
# ==============================================================================
# Homelab Automated Backup Script
# ==============================================================================
set -euo pipefail

BACKUP_DIR="${BACKUP_DIR:-/srv/dev-disk-by-uuid-ef4cba07-46ee-4337-a6a0-c35e8399f14b/backups}"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
DEST="${BACKUP_DIR}/homelab_backup_${TIMESTAMP}"

echo "==> Starting Homelab Backup: ${TIMESTAMP}"
mkdir -p "${DEST}"

# 1. Backup Docker Compose repository configs
echo "==> Backing up compose configurations..."
tar -czf "${DEST}/stacks_configs.tar.gz" -C /Home/pi homelab

# 2. Backup Komodo Stacks volume
if [ -d "/var/lib/docker/volumes/komodo_stacks/_data" ]; then
    echo "==> Backing up Komodo stacks volume..."
    sudo tar -czf "${DEST}/komodo_stacks.tar.gz" -C /var/lib/docker/volumes/komodo_stacks _data
fi

# 3. Backup Glance dashboard configs
if [ -d "/Home/pi/glance/config" ]; then
    echo "==> Backing up Glance configs..."
    tar -czf "${DEST}/glance_config.tar.gz" -C /Home/pi/glance config
fi

# 4. Clean backups older than 14 days
echo "==> Pruning backups older than 14 days..."
find "${BACKUP_DIR}" -maxdepth 1 -type d -name "homelab_backup_*" -mtime +14 -exec rm -rf {} +

echo "==> Backup completed successfully at ${DEST}"
