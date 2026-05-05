{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      
      # Adicionar binários globais do NPM ao PATH
      fish_add_path /home/matheus/.npm-global/bin

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
      clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
      celar = "printf '\\033[2J\\033[3J\\033[1;1H'";
      claer = "printf '\\033[2J\\033[3J\\033[1;1H'";
      rebuild = "sudo nixos-rebuild switch --flake /home/matheus/mydots-nixos --impure";
    };
  };

  # Habilitar eza (modern ls) com integração automática de aliases
  programs.eza = {
    enable = true;
    icons = "auto";
    enableFishIntegration = true;
  };
}
