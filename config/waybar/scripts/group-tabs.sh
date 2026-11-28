#!/usr/bin/env bash
print_tabs() {
  local active_json clients_json
  active_json=$(hyprctl -j activewindow 2>/dev/null)
  clients_json=$(hyprctl -j clients 2>/dev/null)

  jq -rn --argjson active "$active_json" --argjson clients "$clients_json" '
    if ($active.grouped | length) > 1 then
      $active.address as $cur |
      $active.grouped | to_entries | map(
        .key as $idx |
        .value as $addr |
        ([$clients[] | select(.address == $addr)][0] // {}) as $win |
        (($win.class // $win.initialClass // "Win") | split(".") | last) as $name |
        if $addr == $cur then "[\($idx + 1):\($name)]" else "\($idx + 1):\($name)" end
      ) | join("  ")
    else
      ""
    end
  '
}

print_tabs
socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
  case "$line" in
    activewindow*|changegroupactive*|moveintogroup*|moveoutofgroup*|togglegroup*|openwindow*|closewindow*)
      print_tabs
      ;;
  esac
done
