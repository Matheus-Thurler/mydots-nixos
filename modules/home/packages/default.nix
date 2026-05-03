{ pkgs, ... }:

{
  home.packages = with pkgs; [
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
    # Kubernetes e Cloud
    kubectl
    kubectx # Isso instala o 'kubectx' E o 'kubens'
    # Ferramentas
    hugo
    python3
    terraform
    go
    spotify
    discord
    steam
    kind
    tree
    dnsutils
    obsidian
    p7zip
    distrobox
    git
    docker-compose
    docker
    ansible
  ];
}
