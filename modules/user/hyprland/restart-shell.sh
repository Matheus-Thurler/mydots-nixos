#!/usr/bin/env bash
# Auto-restart shell script
# Ensures the correct shell is running based on shell-config.nix

set -e

# Read active shell from config
ACTIVE_SHELL=$(grep "activeShell" /home/matheus/mydots-nixos/modules/user/shell-config.nix | cut -d'"' -f2)

echo "⚙️  Configured shell: $ACTIVE_SHELL"

function ensure_shell() {
  local target_process=$1
  local start_cmd=$2

  if pgrep -u $UID -x "$target_process" >/dev/null || pgrep -u $UID -f "$target_process" >/dev/null; then
    echo "✅ $target_process is already running."
  else
    echo "🚀 Starting $target_process..."
    # Ensure others are dead first to prevent conflicts
    if [[ "$target_process" != *"waybar"* ]]; then pkill -9 waybar 2>/dev/null || true; fi
    if [[ "$target_process" != *"caelestia"* ]]; then pkill -9 caelestia-shell 2>/dev/null || true; fi
    if [[ "$target_process" != *"dms"* ]]; then pkill -9 dms 2>/dev/null || true; fi
    
    $start_cmd &
  fi
}

case $ACTIVE_SHELL in
  waybar)
    ensure_shell "waybar" "waybar"
    ;;
  caelestia)
    ensure_shell "caelestia-shell" "caelestia-shell"
    ;;
  dms)
    ensure_shell "dms" "dms run"
    ;;
  *)
    echo "❌ Unknown shell: $ACTIVE_SHELL"
    exit 1
    ;;
esac

echo "✅ Shell check complete!"
