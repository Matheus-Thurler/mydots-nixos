{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      
      # Starship Transience
      function starship_transient_prompt_func
        starship module character
      end

      if test "$TERM" != "linux"
        starship init fish | source
        enable_transience
      end
    '';
    shellAliases = {
      ls = "eza --icons";
      ll = "eza -l --icons";
      la = "eza -la --icons";
      clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
      celar = "printf '\\033[2J\\033[3J\\033[1;1H'";
      claer = "printf '\\033[2J\\033[3J\\033[1;1H'";
      rebuild = "sudo nixos-rebuild switch --flake ~/mydtos-nixos --impure";
    };
  };

  home.packages = with pkgs; [
    eza
  ];
}
