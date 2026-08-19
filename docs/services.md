# Homelab Services Catalog

Complete registry of all containerized and host services running on the homelab node.

## Port Allocation Matrix

| Category | Service | Container / Daemon | Port(s) | Access URL |
|---|---|---|---|---|
| **Dashboards** | Glance | `glance` | `8081` | `http://10.0.0.50:8081` |
| | Lab-Dash | `lab-dash` | `2022` | `http://10.0.0.50:2022` |
| | HomeDock OS | `homedock-os` | `13370` | `http://10.0.0.50:13370` |
| | DeQ | `deq.service` | `5050` | `http://10.0.0.50:5050` |
| **Management** | Komodo Core | `komodo-core-1` | `9120` | `http://10.0.0.50:9120` |
| | Portainer EE | `portainer` | `9443` (HTTPS), `8000` | `https://10.0.0.50:9443` |
| | Dockscope | `dockscope` | `4681` | `http://10.0.0.50:4681` |
| | Dockpeek | `dockpeek` | `3420` | `http://10.0.0.50:3420` |
| | Webmin | `webmin.service` | `10000` | `https://10.0.0.50:10000` |
| | VS Code Server | `code-server` | `1606` | `http://10.0.0.50:1606` |
| **Monitoring** | Beszel Hub | `beszel` | `8090` | `http://10.0.0.50:8090` |
| | Uptime Kuma | `uptime-kuma` | `3001` | `http://10.0.0.50:3001` |
| **Media** | Jellyfin | `jellyfin` | `8096`, `8920` | `http://10.0.0.50:8096` |
| | Jellyseerr | `jellyseerr` | `5055` | `http://10.0.0.50:5055` |
| | Sonarr | `sonarr` | `8989` | `http://10.0.0.50:8989` |
| | Radarr | `radarr` | `7878` | `http://10.0.0.50:7878` |
| | Lidarr | `lidarr` | `8686` | `http://10.0.0.50:8686` |
| | Bazarr | `bazarr` | `6767` | `http://10.0.0.50:6767` |
| | Prowlarr | `prowlarr` (VPN) | `9696` | `http://10.0.0.50:9696` |
| | qBittorrent | `qbittorrent` (VPN) | `8080` | `http://10.0.0.50:8080` |
| | Deluge | `deluge` (VPN) | `8112` | `http://10.0.0.50:8112` |
| | NZBGet | `nzbget` (VPN) | `6789` | `http://10.0.0.50:6789` |
| | FlareSolverr | `flaresolverr` (VPN)| `8191` | `http://10.0.0.50:8191` |
| **Networking** | Nginx Proxy Manager | `nginx-app-1` | `80`, `81` (Admin), `443` | `http://10.0.0.50:81` |
| | RustDesk Server | `hbbs` / `hbbr` | `21115-21119` | Client Connection |
| | WolfUSB | `wolfusb.service` | `3240` | Remote USB Sharing |
| | WolfStack | `wolfstack.service` | `8550`, `8553`, `8554` | Remote GPU & Management |
| | AdGuard Home | `adguardhome` | `53`, `3000` | `http://10.0.0.50:3000` |
| **Photos & Storage** | Immich | `immich_server` | `2283` | `http://10.0.0.50:2283` |
| | Filestash | `filestash` | `8334` | `http://10.0.0.50:8334` |
| | Collabora CODE | `collabora` | `9980` | WOPI Server |
| | Copyparty | `copyparty` | `3923` | `http://10.0.0.50:3923` |
| | TheOneFile | `theonefile` | `10101` | `http://10.0.0.50:10101` |
| | Samba / SMB | `smbd.service` | `139`, `445` | `smb://10.0.0.50` |
| **Bookmarks** | Linkwarden | `linkwarden` | `3003` | `http://10.0.0.50:3003` |
| **AI & Automation**| Home Assistant | `homeassistant` | `8123` | `http://10.0.0.50:8123` |
| | Ntfy | `ntfy` | `1680` | `http://10.0.0.50:1680` |
| | Ollama | `ollama` | `11434` | `http://10.0.0.50:11434` |
| | Odysseus Agent | `odysseus` | `7001` | `http://10.0.0.50:7001` |
| | OpenJarvis AI | `openjarvis.service`| `7200` | `http://10.0.0.50:7200` |
| **Security** | Authentik | `authentik-server` | `7000`, `2443` | `http://10.0.0.50:7000` |
| | Wazuh SIEM | `wazuh-dashboard` | `7443` | `https://10.0.0.50:7443` |
