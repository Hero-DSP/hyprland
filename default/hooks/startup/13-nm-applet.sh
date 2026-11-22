#!/bin/bash

if command -v nm-applet >/dev/null 2>&1 && systemctl is-active --quiet NetworkManager; then
  # Ensure user keyring storage (psk-flags=1) is enforced on saved Wi-Fi profiles
  while IFS=: read -r name type; do
    if [[ "$type" == "802-11-wireless" ]]; then
      nmcli -g 802-11-wireless-security.psk-flags connection show "$name" 2>/dev/null | grep -qx "1" || \
        nmcli connection modify "$name" wifi-sec.psk-flags 1 2>/dev/null
    fi
  done < <(nmcli -t -f NAME,TYPE connection show 2>/dev/null)

  pidof -q nm-applet || exec app2unit -- nm-applet --indicator
fi
