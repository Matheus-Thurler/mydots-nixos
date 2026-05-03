{ config, pkgs, inputs, ... }:

{
  imports = [
    ./colors.nix
    ./settings.nix
    ./hyprland.nix
    ./plugins.nix
    ./widgets.nix
  ];

  programs.noctalia-shell = {
    enable = true;
    package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
      calendarSupport = true;
    };
  };
}
