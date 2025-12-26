{ config, pkgs, ... }:

{
  # Caelestia Shell - Desktop Environment
  programs.caelestia = {
    enable = true;
    
    systemd = {
      enable = false;
      target = "graphical-session.target";
      environment = [];
    };
    
    settings = {
      # Appearance
      appearance = {
        font = {
          family = {
            sans = "Rubik";
            mono = "CaskaydiaCove NF";
            clock = "Rubik";
            material = "Material Symbols Rounded";
          };
        };
        transparency = {
          enabled = false;
          base = 0.85;
          layers = 0.4;
        };
      };
      
      # General configuration
      general = {
        apps = {
          terminal = ["kitty"];
          audio = ["pavucontrol"];
          playback = ["mpv"];
          explorer = ["thunar"];
        };
        battery = {
          warnLevels = [
            { level = 20; title = "Low battery"; message = "You might want to plug in a charger"; icon = "battery_android_frame_2"; }
            { level = 10; title = "Did you see the previous message?"; message = "You should probably plug in a charger <b>now</b>"; icon = "battery_android_frame_1"; }
            { level = 5; title = "Critical battery level"; message = "PLUG THE CHARGER RIGHT NOW!!"; icon = "battery_android_alert"; critical = true; }
          ];
          criticalLevel = 3;
        };
        idle = {
          lockBeforeSleep = true;
          inhibitWhenAudio = true;
          timeouts = [];  # Disabled - no automatic idle actions
        };
      };
      
      # Dashboard
      dashboard = {
        enabled = true;
        showUserAvatar = false;  # Avatar disabled
      };
      
      # Bar configuration
      bar = {
        status = {
          showBattery = false;
          showNetwork = true;
          showBluetooth = true;
          showLockStatus = true;
          showIdleInhibit = true;
          showAudio = false;
          showMicrophone = false;
          showKbLayout = false;
        };
        persistent = true;
        showOnHover = true;
        workspaces = {
          perMonitorWorkspaces = true;
          showWindows = true;
          shown = 5;
          activeIndicator = true;
          label = "";  # Empty - shows workspace number
          activeLabel = "";  # Empty - shows workspace number
          occupiedLabel = "";  # Empty - shows workspace number
          occupiedBg = false;
        };
      };
      
      # Paths
      paths = {
        wallpaperDir = "~/Pictures/Wallpapers";
        mediaGif = "";  # Disable media animation
        sessionGif = "";  # Disable session animation
      };
      
      # Launcher settings
      launcher = {
        vimKeybinds = false;
        enableDangerousActions = false;
        maxShown = 7;
      };
      
      # Notifications
      notifs = {
        defaultExpireTimeout = 5000;
        expire = false;
      };
      
      # OSD (On-Screen Display)
      osd = {
        enabled = true;
        enableBrightness = true;
        hideDelay = 2000;
      };
      
      # Services
      services = {
        audioIncrement = 0.1;
        maxVolume = 1.0;
        useTwelveHourClock = false;
        smartScheme = true;
      };
    };
    
    # CLI configuration
    cli = {
      enable = true;
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
