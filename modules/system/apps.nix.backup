# modules/system/apps.nix
{ pkgs, inputs, ... }:

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

  # --- DOCKER ---
  virtualisation.docker.enable = true;

  # --- VIRTUALBOX (Backend para o Vagrant) ---
  virtualisation.virtualbox.host.enable = true;
  # Opcional: Habilita o Extension Pack (USB 2.0/3.0, etc) - exige licença proprietária
  # virtualisation.virtualbox.host.enableExtensionPack = true;

  # 3. Lista Geral de Apps do Sistema
  environment.systemPackages = with pkgs; [
    # Criatividade / Trabalho
    davinci-resolve
    inputs.antigravity-nix.packages.x86_64-linux.default # Google Antigravity IDE
    
    # Internet
    google-chrome
    
    # Utilitários de Sistema básicos
    vim
    git
    wget
    curl
    nfs-utils
    docker-compose
    vagrant
    p7zip
  ];
}