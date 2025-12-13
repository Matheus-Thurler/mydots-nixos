{ pkgs, ... }:

{
  home.packages = with pkgs; [
    htop
    btop
    ripgrep
    jq
    fzf
    fastfetch # Opcional: pra mostrar infos do sistema bonitinho
    # Kubernetes e Cloud
    kubectl
    kubectx # Isso instala o 'kubectx' E o 'kubens'
    
    # Ferramentas
    hugo
    python3
    terraform
    go

    # GUI Utils
    rofi
    xfce.thunar
    adwaita-icon-theme

    # Hyprland Essentials
    waybar
    dunst
    swww
    networkmanagerapplet
  ];
}