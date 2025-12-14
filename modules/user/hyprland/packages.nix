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
    swww
    networkmanagerapplet
    pavucontrol
    swww
    networkmanagerapplet
    pavucontrol
    wlogout
    pulseaudio
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
  ];
}
