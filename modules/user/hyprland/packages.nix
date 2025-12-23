{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI Utils (Relacionados ao Workflow)
    rofi
    xfce.thunar
    adwaita-icon-theme

    # Hyprland Essentials
    waybar
    swww
    waypaper # GUI Wallpaper Manager with Preview
    networkmanagerapplet
    pavucontrol
    wlogout
    pulseaudio
    pamixer       # CLI Audio Control
    brightnessctl # Controle de brilho (Software/Laptop)
    ddcutil       # Controle de brilho (Monitor Externo)
    
    # Waybar Addons
    blueman
    playerctl
    gsimplecal
    libnotify # Notificações via script

    # Screenshot
    grim
    slurp
    wl-clipboard
    pyprland
    gnome-text-editor
  ];
}
