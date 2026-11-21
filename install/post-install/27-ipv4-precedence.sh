#!/bin/bash

if ! grep -q "^precedence ::ffff:0:0/96  100" /etc/gai.conf 2>/dev/null; then
  echo "precedence ::ffff:0:0/96  100" | sudo tee -a /etc/gai.conf >/dev/null
fi
