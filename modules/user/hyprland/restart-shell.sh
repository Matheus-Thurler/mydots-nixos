#!/usr/bin/env bash
# Auto-restart shell script
# Kills old shell and starts new one based on shell-config.nix

set -e

# Read active shell from config
ACTIVE_SHELL=$(grep "activeShell" /home/matheus/mydots-nixos/modules/user/shell-config.nix | cut -d'"' -f2)

echo "🔄 Switching to: $ACTIVE_SHELL"

# Kill all shells (ensure clean state)
pkill -9 waybar 2>/dev/null || true
pkill -9 caelestia-shell 2>/dev/null || true
pkill -9 quickshell 2>/dev/null || true
pkill -9 dms 2>/dev/null || true

sleep 0.5

# Check if the target shell is already running (prevent duplicates)
case $ACTIVE_SHELL in
  waybar)
    if pgrep -x waybar >/dev/null; then
      echo "✅ Waybar already running, skipping"
      exit 0
    fi
    echo "🚀 Starting Waybar..."
    waybar &
    ;;
  caelestia)
    if pgrep -x quickshell >/dev/null; then
      echo "✅ Caelestia already running, skipping"
      exit 0
    fi
    echo "🚀 Starting Caelestia..."
    caelestia-shell &
    ;;
  dms)
    if pgrep -x quickshell >/dev/null; then
      echo "✅ DMS already running, skipping"
      exit 0
    fi
    echo "🚀 Starting DMS..."
    dms run &
    ;;
  *)
    echo "❌ Unknown shell: $ACTIVE_SHELL"
    exit 1
    ;;
esac

echo "✅ Shell switched!"
