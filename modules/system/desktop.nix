{ config, pkgs, ... }:

{
  # --- 1. Interface Gráfica e Login (GDM) ---
  services.xserver.enable = true;

  # Gerenciador de Login (GDM funciona bem com Hyprland e GNOME)
  services.displayManager.gdm.enable = true;
  
  # Desktop GNOME (Mantemos como backup/ambiente principal)
  # NOTA: Corrigi o caminho antigo que gerava warning (services.xserver.desktopManager...)
  services.desktopManager.gnome.enable = true;
 

  # --- 2. Hyprland (Habilitando no Sistema) ---
  programs.hyprland = {
    enable = true;
    xwayland.enable = true; # Permite rodar apps que não são nativos Wayland
  };

  # --- 3. Aceleração Gráfica (Obrigatório para Hyprland) ---
  hardware.graphics = {
    enable = true;
  };

  # --- 4. Utilitários de Sistema Essenciais ---
  environment.systemPackages = with pkgs; [
    wl-clipboard  # Para funcionar o Ctrl+C / Ctrl+V no Wayland
    kitty         # Terminal recomendado para Hyprland (rápido e compatível)
  ];

  # --- 5. Configurações de Teclado (Mantendo o seu setup) ---
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };
  console.keyMap = "us-acentos";

  # --- 6. Serviços de Áudio e Impressão (Mantidos) ---
  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}