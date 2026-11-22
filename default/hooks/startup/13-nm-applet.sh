#!/bin/bash

if command -v nm-applet >/dev/null 2>&1 && systemctl is-active --quiet NetworkManager; then
  pidof -q nm-applet || exec app2unit -- nm-applet --indicator
fi
