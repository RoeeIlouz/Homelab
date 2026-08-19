# Disaster Recovery & System Restoration Guide

Complete runbook to restore the entire homelab from scratch or recover from hardware failure.

## 1. Prerequisites & Base System Setup

1. Flash Debian 13 (Trixie) or Raspberry Pi OS 64-bit to NVMe SSD.
2. Install Docker & Docker Compose plugin:
   ```bash
   curl -fsSL https://get.docker.com -o get-docker.sh
   sudo sh get-docker.sh
   sudo usermod -aG docker pi
   ```
3. Mount the secondary storage drive at `/srv/dev-disk-by-uuid-...`:
   ```bash
   sudo mkdir -p /srv/dev-disk-by-uuid-ef4cba07-46ee-4337-a6a0-c35e8399f14b
   # Add entry to /etc/fstab for auto-mount
   ```

## 2. Restore Homelab Repository & Configurations

1. Clone the homelab repository:
   ```bash
   git clone https://github.com/RoeeIlouz/Homelab.git /Home/pi/homelab
   cd /Home/pi/homelab
   ```
2. Initialize directory structures:
   ```bash
   chmod +x scripts/*.sh
   ./scripts/setup-environment.sh
   ```
3. Extract configuration and database archives from the latest backup:
   ```bash
   # Example:
   tar -xzf /path/to/backup/komodo_stacks.tar.gz -C /var/lib/docker/volumes/komodo_stacks
   ```

## 3. Restore Environment Files (.env)

Populate all `.env` files across the `stacks/` subdirectories with required credentials, tokens, and encryption keys.

## 4. Launch Core Infrastructure

Start stacks in the recommended order:
1. **Networking**:
   ```bash
   docker compose -f stacks/networking/nginx-proxy-manager/compose.yaml up -d
   docker compose -f stacks/networking/cloudflare-tunnel/compose.yaml up -d
   docker compose -f stacks/networking/twingate/compose.yaml up -d
   ```
2. **Management & Monitoring**:
   ```bash
   docker compose -f stacks/management/komodo/compose.yaml up -d
   docker compose -f stacks/monitoring/compose.yaml up -d
   docker compose -f stacks/dashboards/compose.yaml up -d
   ```
3. **Media & Applications**:
   ```bash
   docker compose -f stacks/media/compose.yaml up -d
   docker compose -f stacks/photos-and-cloud/immich/compose.yaml up -d
   ```

## 5. Verify Health

Run the diagnostic health checker:
```bash
./scripts/check-health.sh
```
