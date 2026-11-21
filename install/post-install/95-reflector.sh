#!/bin/bash

helpers::log::info "Configuring reflector mirrors"

helpers::write_file /etc/xdg/reflector/reflector.conf <<'EOF2'
--save /etc/pacman.d/mirrorlist
--protocol https
--country Nepal,India,China,Singapore,Bangladesh,"Hong Kong",Japan,Taiwan,Netherlands,Germany
--latest 10
--sort rate
--connection-timeout 3
--download-timeout 3
EOF2

sudo systemctl enable --now reflector.timer
