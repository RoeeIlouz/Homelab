# Host Systemd Services

Unit files for native system services running outside Docker containers.

## Installation

To install a service unit to systemd:

```bash
# Copy unit file to systemd directory
sudo cp code-server.service /etc/systemd/system/

# Reload systemd daemon
sudo systemctl daemon-reload

# Enable and start the service
sudo systemctl enable --now code-server.service

# Check service status
sudo systemctl status code-server.service
```
