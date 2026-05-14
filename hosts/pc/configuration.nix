{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/common
    ../../modules/nixos/nvidia
    ../../modules/nixos/k3s
  ];

  networking.hostName = "nixos-pc";

  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };
  console.keyMap = "us-intl";
}
