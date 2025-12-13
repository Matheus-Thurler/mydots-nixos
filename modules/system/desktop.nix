{ config, pkgs, ... }:

{
  # X11 e Gnome
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Teclado
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };
  console.keyMap = "us-acentos";

  # Impressão
  services.printing.enable = true;

  # Áudio (Pipewire)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}