{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI Apps
    google-chrome
    vscode
    spotify
    discord
    slack
    obsidian
    thunar
    vlc
    localsend
    
    # CLI Tools
    json-diff 
    kitty     
    yaru-theme
    grim        
    slurp       
    swappy      
    wl-clipboard
    htop
    btop
    ripgrep
    jq
    fzf
    fastfetch
    tree
    dnsutils
    p7zip
    curl
    wget

    # Kubernetes e Cloud
    kubectl
    kubectx 
    kind
    google-cloud-sdk
    
    # Desenvolvimento e Infra
    nodejs_24
    hugo
    python3
    terraform
    go
    ansible
    distrobox
    distroshelf
    
    # Games
    steam
  ];
}
