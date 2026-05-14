{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/common
    ../../modules/nixos/nvidia
  ];

  networking.hostName = "nixos-laptop";

  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };
  console.keyMap = "br-abnt2";
}
