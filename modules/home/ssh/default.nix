{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    
    # Resolve warnings: disable default config and move keys to matchBlocks
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
      };
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  # Instruções para o usuário:
  # Para criar sua chave SSH:
  # ssh-keygen -t ed25519 -C "matheusthurler@gmail.com"
  # eval $(ssh-agent -s)
  # ssh-add ~/.ssh/id_ed25519
  # cat ~/.ssh/id_ed25519.pub -> Adicionar ao GitHub
}
