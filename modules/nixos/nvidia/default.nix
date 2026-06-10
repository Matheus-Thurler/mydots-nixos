{ config, pkgs, ... }:

{
  # Configuração NVIDIA
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # NVIDIA Container Toolkit para Docker
  hardware.nvidia-container-toolkit.enable = true;

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
  };
}
