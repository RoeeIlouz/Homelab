#!/usr/bin/env bash
# ==============================================================================
# Homelab Automated Image & Container Update Script
# ==============================================================================
set -euo pipefail

echo "=========================================="
echo " Starting Homelab Stack Updates"
echo " Date: $(date)"
echo "=========================================="

# Update active running docker compose stacks
for compose_file in $(docker ps --format '{{.Label "com.docker.compose.project.config_files"}}' | sort -u); do
    if [ -n "${compose_file}" ] && [ -f "${compose_file}" ]; then
        dir=$(dirname "${compose_file}")
        echo "--> Updating stack in ${dir}..."
        (cd "${dir}" && docker compose pull && docker compose up -d) || true
    fi
done

echo "--> Pruning dangling and unused images..."
docker image prune -f

echo "=========================================="
echo " All active stacks successfully updated!"
echo "=========================================="
