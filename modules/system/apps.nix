# modules/system/apps.nix
{ pkgs, ... }:

{
  # 1. Navegadores
  programs.firefox.enable = true;

  # 2. OBS Studio (Movido do nvidia.nix)
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override { 
      cudaSupport = true; 
    };
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs             
      obs-backgroundremoval 
      obs-pipewire-audio-capture 
    ];
  };

  # 3. Lista Geral de Apps do Sistema
  environment.systemPackages = with pkgs; [
    # Criatividade / Trabalho
    davinci-resolve
    antigravity # (Verifique se esse pacote existe mesmo, mantive do seu original)
    
    # Internet
    google-chrome
    
    # Utilitários de Sistema básicos
    vim
    git
    wget
    curl
    nfs-utils
  ];
}