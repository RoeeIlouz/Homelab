#!/usr/bin/env bash
# ==============================================================================
# Homelab Environment Initialization Script
# ==============================================================================
set -euo pipefail

echo "==> Creating required storage and configuration directories..."
sudo mkdir -p /data/media/movies /data/media/tv /data/media/music /data/media/downloads
sudo mkdir -p /data/wazuh
sudo chown -R 1000:1000 /data/media

echo "==> Copying .env.example files to .env where missing..."
find /Home/pi/homelab/stacks -name ".env.example" | while read -r example; do
    target_env="$(dirname "${example}")/.env"
    if [ ! -f "${target_env}" ]; then
        echo "Creating ${target_env} from template..."
        cp "${example}" "${target_env}"
    fi
done

echo "==> Initializing Docker network: servarrnetwork..."
docker network inspect servarrnetwork >/dev/null 2>&1 || docker network create --subnet 172.39.0.0/24 servarrnetwork

echo "==> Environment ready! Populate .env files with your secrets."
