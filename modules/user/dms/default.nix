{ config, pkgs, ... }:

{
  # DankMaterialShell Configuration
  # https://danklinux.com/docs/dankmaterialshell/nixos
  
  programs.dms-shell = {
    enable = true;
    
    # Systemd service for auto-start
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    
    # Core features
    enableSystemMonitoring = true;   # System monitoring widgets (dgop)
    enableClipboard = true;           # Clipboard history manager
    enableVPN = false;                # VPN management widget
    enableDynamicTheming = true;      # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;     # Audio visualizer (cava)
    enableCalendarEvents = false;     # Calendar integration (khal)
  };
}
