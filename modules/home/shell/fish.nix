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
    };
    functions = {
      rebuild = {
        body = ''
          set -l host $argv[1]
          if test -z "$host"
              set host (hostname)
          end

          if not string match -q "nixos-*" "$host"
              echo "⚠️  Hostname '$host' não segue o padrão 'nixos-pc' ou 'nixos-laptop'."
              echo "💡 Tente: rebuild nixos-pc ou rebuild nixos-laptop"
              return 1
          end

          echo "🔨 Rebuilding NixOS for host: $host..."
          sudo nixos-rebuild switch --flake /home/matheus/mydots-nixos#$host --impure
        '';
      };
    };
  };

  # Habilitar eza (modern ls) com integração automática de aliases
  programs.eza = {
    enable = true;
    icons = "auto";
    enableFishIntegration = true;
  };
}
