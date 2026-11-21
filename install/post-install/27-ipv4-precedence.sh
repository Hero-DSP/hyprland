#!/bin/bash

sudo pacman -S --noconfirm --needed dnsmasq

sudo mkdir -p /etc/NetworkManager/dnsmasq.d /etc/NetworkManager/conf.d
printf 'address=/flathub.org/::\n' | sudo tee /etc/NetworkManager/dnsmasq.d/flathub-ipv4.conf >/dev/null
printf '[main]\ndns=dnsmasq\n' | sudo tee /etc/NetworkManager/conf.d/00-use-dnsmasq.conf >/dev/null

sudo systemctl restart NetworkManager
