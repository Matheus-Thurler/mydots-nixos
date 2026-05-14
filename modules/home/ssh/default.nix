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
      "gitlab-eficify" = {
        hostname = "gitlab.com";
        user = "git";
        identityFile = "~/.ssh/eficify/id_ed25519_eficify";
      };
    };
  };

  # Garante que o diretório exista
  home.file.".ssh/eficify/.keep".text = "";

  # Instruções para o usuário:
  # Para criar sua chave SSH principal:
  # ssh-keygen -t ed25519 -C "matheusthurler@gmail.com" -f ~/.ssh/id_ed25519
  #
  # Para criar a chave da Eficify:
  # mkdir -p ~/.ssh/eficify
  # ssh-keygen -t ed25519 -f ~/.ssh/eficify/id_ed25519_eficify -C "matheus@eficify.com.br"
  #
  # eval $(ssh-agent -s)
  # ssh-add ~/.ssh/id_ed25519
  # ssh-add ~/.ssh/eficify/id_ed25519_eficify
  # cat ~/.ssh/id_ed25519.pub -> Adicionar ao GitHub
}
