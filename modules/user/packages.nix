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
    spotify
    discord
    handbrake # Conversor de Vídeo (Alternativa ao WinFF)
  ];
}