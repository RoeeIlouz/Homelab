#!/usr/bin/env bash
# ==============================================================================
# Homelab Health & Diagnostics Script
# ==============================================================================

echo "========================================================"
echo " HOMELAB HEALTH REPORT - $(hostname) - $(date)"
echo "========================================================"

echo ""
echo "[1] System Load & Memory:"
uptime
free -h

echo ""
echo "[2] Storage Utilization:"
df -h / /srv/* 2>/dev/null || df -h /

echo ""
echo "[3] CPU Temperature (Raspberry Pi):"
if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
    temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    echo "Current Temp: $((temp/1000))°C"
else
    echo "Thermal sensor not found."
fi

echo ""
echo "[4] Docker Containers Status:"
docker ps --format "table {{.Names}}	{{.Status}}	{{.Ports}}"

echo ""
echo "[5] Running Host Systemd Services:"
systemctl is-active code-server@pi deq wolfstack wolfnet wolfusb docker smbd || true

echo ""
echo "========================================================"
echo " Health check finished."
echo "========================================================"
