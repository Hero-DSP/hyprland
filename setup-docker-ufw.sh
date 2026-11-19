#!/usr/bin/env bash

set -euo pipefail

if ! command -v ufw >/dev/null 2>&1; then
  echo "Error: UFW is not installed." >&2
  exit 1
fi

# Automatically install ufw-docker from the AUR if it's missing
if ! command -v ufw-docker >/dev/null 2>&1; then
  echo "==> ufw-docker not found. Installing from AUR..."
  if command -v yay >/dev/null 2>&1; then
    yay --noconfirm -S --needed ufw-docker
  elif command -v paru >/dev/null 2>&1; then
    paru --noconfirm -S --needed ufw-docker
  else
    echo "Error: Neither yay nor paru found. Please install ufw-docker manually." >&2
    exit 1
  fi
fi

# Ensure Docker containers can resolve DNS through the host bridge
sudo ufw allow in on docker0 to any port 53 comment "Docker DNS"

sudo ufw-docker install
sudo systemctl restart ufw
sudo ufw reload

if systemctl is-active --quiet docker; then
  sudo systemctl restart docker
fi

echo "ufw-docker integration configured successfully."
