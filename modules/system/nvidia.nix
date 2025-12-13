# modules/system/nvidia.nix
{ config, pkgs, ... }:

{
  # Drivers Gráficos
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
      ocl-icd
      egl-wayland
    ];
  };

  # Configuração da GPU Nvidia
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Variáveis de Ambiente para Wayland/Nvidia
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NIXOS_OZONE_WL = "1"; 
  };

  services.xserver.videoDrivers = ["nvidia"];
}