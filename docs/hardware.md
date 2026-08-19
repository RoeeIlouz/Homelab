# Homelab Hardware Specification

Detailed hardware specification and topology for the primary homelab node (`raspberrypi`).

## System Architecture

| Component | Specification |
|---|---|
| **Host System** | Raspberry Pi 5 Model B Rev 1.0 |
| **SoC / CPU** | Broadcom BCM2712 (4x ARM Cortex-A76 @ 2.4 GHz) |
| **Instruction Set** | `aarch64` / ARMv8.2-A 64-bit |
| **System Memory** | 8.0 GiB LPDDR4X-4267 SDRAM |
| **Swap Memory** | 2.0 GiB ZRAM (`/dev/zram0`) |
| **Operating System** | Debian GNU/Linux 13 (Trixie) / Linux Kernel 6.18.39+rpt-rpi-2712 |

## Storage Subsystems

```
NVMe SSD (1 TB)              MicroSD (256 GB)
[/dev/nvme0n1]               [/dev/mmcblk0]
  ├── nvme0n1p1 (510M FAT32)   └── mmcblk0p1 (234G ext4)
  │    └── /boot/firmware           └── /srv/dev-disk-by-uuid-ef4c...
  └── nvme0n1p2 (917G ext4)
       └── / (OS + Docker + /data)
```

1. **Primary High-Speed NVMe SSD (PCIe Gen 3.0 via M.2 HAT)**
   - Device: `/dev/nvme0n1`
   - Capacity: 1.0 TB (~917 GiB Usable)
   - Mount: `/` (Root Filesystem) & `/export/Home`
   - Purpose: Operating system, Docker images & containers, active database engines, AI models, high-throughput I/O.

2. **Secondary High-Capacity MicroSD Card**
   - Device: `/dev/mmcblk0`
   - Capacity: 256 GB (~234 GiB Usable)
   - Mount: `/srv/dev-disk-by-uuid-ef4cba07-46ee-4337-a6a0-c35e8399f14b`
   - Purpose: Docker volume bind mounts, persistent application state, snapshots, and secondary backups.

## Thermal & Power Management

- Active Cooling: Official Raspberry Pi Active Cooler (PWM fan dynamically triggered based on SoC core temperature).
- Nominal Operating Range: 42°C – 55°C under standard container workloads.
