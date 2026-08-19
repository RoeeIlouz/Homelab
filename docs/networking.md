# Networking, Ingress & Security Topology

## Network Addressing & IP Subnets

| Interface | Type | Subnet / Address | Purpose |
|---|---|---|---|
| `eth0` | Gigabit Ethernet | `10.0.0.50/8` | Primary host local area network connection |
| `wolfnet0` | WireGuard Mesh | `10.10.10.50/24` | WolfNet private peer-to-peer encrypted mesh |
| `servarrnetwork` | Docker Bridge | `172.39.0.0/24` | Dedicated private subnet for `*arr` media automation |
| `docker0` | Docker Bridge | `172.17.0.0/16` | Default Docker bridge |

## Ingress & Remote Access Architecture

```mermaid
flowchart TD
    subgraph External["External Access (WAN)"]
        User["User / Mobile Device"]
        CF["Cloudflare Edge Network"]
        TG["Twingate Zero Trust Cloud"]
    end

    subgraph Host["Raspberry Pi 5 (10.0.0.50)"]
        CFTunnel["Cloudflare Tunnel (cloudflared)"]
        TGConnect["Twingate Connectors (careful-kangaroo, large-asp)"]
        NPM["Nginx Proxy Manager (:80, :443)"]
        RustDesk["RustDesk Relay (:21115-21119)"]
        
        subgraph InternalServices["Containerized Services"]
            Glance["Glance Dashboard (:8081)"]
            Jellyfin["Jellyfin Media (:8096)"]
            Immich["Immich Photos (:2283)"]
            Komodo["Komodo Core (:9120)"]
            Beszel["Beszel Hub (:8090)"]
        end
    end

    User -->|HTTPS via Custom Domain| CF --> CFTunnel --> NPM --> InternalServices
    User -->|Zero Trust Mesh| TG --> TGConnect --> InternalServices
    User -->|Direct Remote Desktop| RustDesk
```

## VPN & Privacy Routing (Gluetun Kill-Switch)

All high-bandwidth download clients (`qBittorrent`, `Deluge`, `NZBGet`, `Prowlarr`, `FlareSolverr`) route 100% of their egress traffic through the `gluetun` container:
- Protocol: WireGuard
- Provider: AirVPN (or configured provider)
- Forwarded Port: 6881
- Kill-switch: If the VPN tunnel drops, network traffic is instantly blocked at the kernel network namespace level.
- Healing: `deunhealth` container monitors `gluetun` health checks and restarts dependent containers when connectivity is recovered.
