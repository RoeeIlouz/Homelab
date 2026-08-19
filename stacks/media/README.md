# Media & Entertainment Stack

Automated, private, and secure media pipeline powered by Docker, Jellyfin, Gluetun VPN, and the complete `*arr` automation suite.

## Architecture

- **VPN Protection**: `Gluetun` creates a WireGuard VPN tunnel with an automated kill-switch. Downloaders (`qBittorrent`, `Deluge`, `NZBGet`, `Prowlarr`, `FlareSolverr`) route their network entirely through the Gluetun container (`network_mode: service:gluetun`).
- **Media Ingestion & Automation**:
  - `Prowlarr`: Indexer search manager.
  - `Sonarr`: TV Show tracker and downloader.
  - `Radarr`: Movie collection manager.
  - `Lidarr`: Music album manager.
  - `Bazarr`: Multi-language subtitle retriever.
- **Media Streaming**:
  - `Jellyfin`: Direct playback & transcoding server.
  - `Jellyseerr`: Discovery and request portal for family/users.

## Port Matrix

| Service | Port | Description |
|---|---|---|
| Gluetun / qBittorrent | `8080` (Web UI), `6881` (Torrent) | BitTorrent Web & Transfer |
| Deluge | `8112` (Web UI), `58846` (Daemon) | BitTorrent Client |
| NZBGet | `6789` | Usenet Downloader |
| Prowlarr | `9696` | Indexer Hub |
| FlareSolverr | `8191` | Cloudflare Bypass |
| Sonarr | `8989` | TV Management |
| Radarr | `7878` | Movie Management |
| Lidarr | `8686` | Music Management |
| Bazarr | `6767` | Subtitle Manager |
| Jellyfin | `8096`, `8920`, `1900/udp`, `7359/udp` | Media Streaming Server |
| Jellyseerr | `5055` | User Requests & Discovery |

## Quick Start

1. Copy `.env.example` to `.env`:
   ```bash
   cp .env.example .env
   ```
2. Fill in your VPN provider credentials in `.env`.
3. Start the stack:
   ```bash
   docker compose up -d
   ```
