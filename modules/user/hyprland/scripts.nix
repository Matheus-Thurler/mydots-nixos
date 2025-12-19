{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Scripts Customizados
    (writeShellScriptBin "show-keybinds" ''
      echo -e "  Keybinds\n
      SUPER + Enter    Terminal Quake (Drop-down)
      SUPER + T        Terminal (Kitty)
      SUPER + R        Menu de Apps (Rofi)
      SUPER + E        Arquivos (Thunar)
      SUPER + Q        Fechar Janela
      SUPER + F        Tela Cheia
      SUPER + V        Flutuar Janela
      SUPER + S        Scratchpad (Special Workspace)
      SUPER + Setas    Mover Foco
      SUPER + 1-6      Mudar Workspace
      SUPER + SHIFT + 1-6  Mover Janela para Workspace
      SUPER + M        Sair do Hyprland (Logout)
      SUPER + I        Ver esta lista" | rofi -dmenu -i -p "Atalhos"
    '')

    # (Wallpaper Selector removed in favor of Waypaper)

    (writeShellScriptBin "rofi-audio" ''
      # Select Audio Output (Human Readable)
      
      PACTL="${pkgs.pulseaudio}/bin/pactl"
      ROFI="${pkgs.rofi}/bin/rofi"
      GREP="${pkgs.gnugrep}/bin/grep"
      SED="${pkgs.gnused}/bin/sed"
      PASTE="${pkgs.coreutils}/bin/paste"
      NOTIFY="${pkgs.libnotify}/bin/notify-send"

      # Parse Sinks: Get Name and Description pairs
      # We use 'paste' to join the Name line and the Description line into one line per device
      # Format: Name: <raw_name> \t Description: <nice_name>
      DEVICES=$($PACTL list sinks | $GREP -E '^\s*(Name|Description):' | $SED 's/^\s*//' | $PASTE - -)

      # Extract just the descriptions for Rofi
      DESCRIPTIONS=$(echo "$DEVICES" | $SED 's/.*Description: //')
      
      if [ -z "$DESCRIPTIONS" ]; then
          $NOTIFY "Audio" "No output devices found!"
          exit 1
      fi

      # Show Rofi with readable names (Top Right anchored)
      # Position: Northeast (Top Right), Offset to avoid hitting edge/bar, Fixed width
      THEME_STR='window { location: northeast; anchor: northeast; x-offset: -12px; y-offset: 45px; width: 350px; }'
      
      SELECTED=$(echo "$DESCRIPTIONS" | $ROFI -dmenu -p "Select Audio Output" -theme-str "$THEME_STR" -i)
      
      if [ -n "$SELECTED" ]; then
        # Find the raw Name associated with the selected Description
        SINK_NAME=$(echo "$DEVICES" | $GREP "Description: $SELECTED$" | $SED 's/Name: //' | $SED 's/\t.*//')
        
        if [ -n "$SINK_NAME" ]; then
            $PACTL set-default-sink "$SINK_NAME"
            $NOTIFY "Audio" "Output switched to: $SELECTED"
        else
            $NOTIFY "Audio" "Error finding device ID"
        fi
      fi
    '')

    (writeShellScriptBin "quake-toggle" ''
      # Legacy placeholder
    '')
    
    (writeShellScriptBin "brightness-all" ''
       # Wraps brightnessctl to control ALL connected devices
       # Designed for Desktop with ddcci-driver (external monitors as backlights)
       
       ACTION=$1
       STEP="5%"
       
       # Get list of devices (name only)
       # brightnessctl -l -m outputs: name,class,brightness,max_brightness
       DEVICES=$(brightnessctl -l -m | cut -d, -f1)
       
       if [ -z "$DEVICES" ]; then
           notify-send "Brightness" "No displays detected! (Did you reboot?)"
           exit 1
       fi
       
       for DEV in $DEVICES; do
           if [ "$ACTION" == "up" ]; then
               brightnessctl -q -d "$DEV" set +''${STEP}
           elif [ "$ACTION" == "down" ]; then
               brightnessctl -q -d "$DEV" set ''${STEP}-
           fi
       done
       
       # Get average percentage for notification (from first device)
       FIRST_DEV=$(echo "$DEVICES" | head -n1)
       PERC=$(brightnessctl -d "$FIRST_DEV" info | grep -oP '\(\K[^%]+')
       # Optional: notify-send -h string:x-canonical-private-synchronous:brightness "Brightness" "Level: ''${PERC}%"
    '')

    (writeShellScriptBin "rofi-bluetooth" ''
      # Simple Bluetooth Menu
      
      BLUETOOTHCTL="${pkgs.bluez}/bin/bluetoothctl"
      ROFI="${pkgs.rofi}/bin/rofi"
      GREP="${pkgs.gnugrep}/bin/grep"
      WC="${pkgs.coreutils}/bin/wc"
      CUT="${pkgs.coreutils}/bin/cut"
      NOTIFY="${pkgs.libnotify}/bin/notify-send"
      
      # Position Top Right
      THEME_STR='window { location: northeast; anchor: northeast; x-offset: -12px; y-offset: 45px; width: 250px; }'
      
      # Check power state
      POWER=$($BLUETOOTHCTL show | $GREP "Powered: yes" | $WC -l)
      
      if [ "$POWER" -eq 0 ]; then
        TOGGLE="Turn On"
      else
        TOGGLE="Turn Off"
      fi
      
      OPTIONS="$TOGGLE\nScan on\nScan off\nDevices"
      
      SELECTED=$(echo -e "$OPTIONS" | $ROFI -dmenu -p "Bluetooth Menu" -theme-str "$THEME_STR" -i)
      
      case "$SELECTED" in
        "Turn On") $BLUETOOTHCTL power on ;;
        "Turn Off") $BLUETOOTHCTL power off ;;
        "Scan on") $BLUETOOTHCTL scan on ;;
        "Scan off") $BLUETOOTHCTL scan off ;;
        "Devices") 
            # List paired devices
            DEVICES=$($BLUETOOTHCTL devices | $CUT -d ' ' -f 3-)
            DEV_SELECTED=$(echo "$DEVICES" | $ROFI -dmenu -p "Connect Device" -theme-str "$THEME_STR" -i)
            if [ -n "$DEV_SELECTED" ]; then
               MAC=$($BLUETOOTHCTL devices | $GREP "$DEV_SELECTED" | $CUT -d ' ' -f 2)
               $BLUETOOTHCTL connect "$MAC" && $NOTIFY "Bluetooth" "Connected to $DEV_SELECTED" || $NOTIFY "Bluetooth" "Failed to connect"
            fi
            ;;
      esac
    '')

  ];
}
