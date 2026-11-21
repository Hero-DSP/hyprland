#!/bin/bash

ICONS_DIR="$HOME/.local/share/icons"
VB_ICONS="$VIBRANIUM/extras/icons/Vibranium"
HICOLOR_ICONS="$VIBRANIUM/extras/icons/hicolor"

mkdir -p "$ICONS_DIR"

helpers::copy "$VB_ICONS" "$ICONS_DIR/${VB_ICONS##*/}"
helpers::copy "$HICOLOR_ICONS" "$ICONS_DIR/${HICOLOR_ICONS##*/}"

helpers::symlink "$ICONS_DIR" "$HOME/.icons"
