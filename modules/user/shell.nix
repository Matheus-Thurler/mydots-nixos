{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      rebuild = "sudo nixos-rebuild switch";
      update = "sudo nix-channel --update && sudo nixos-rebuild switch";
    };
  };
}