{ ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "matheus" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/matheus/id_rsa";
        identitiesOnly = true;
      };
      "gitlab.com" = {
        hostname = "gitlab.com";
        user = "git";
        identityFile = "~/.ssh/matheus-gitlab/id_rsa_matheus_gitlab";
        extraOptions = { PreferredAuthentications = "publickey"; };
      };
    };
  };

  # Garante permissões corretas nos arquivos SSH
  home.activation.fixSshPermissions = ''
    # Corrige permissões do diretório .ssh
    if [ -d "$HOME/.ssh" ]; then
      chmod 700 "$HOME/.ssh"
      
      # Nota: não modificamos o arquivo config pois é um symlink read-only gerenciado pelo Nix
      
      # Corrige permissões das chaves privadas do GitHub
      if [ -d "$HOME/.ssh/matheus" ]; then
        chmod 700 "$HOME/.ssh/matheus"
        if [ -f "$HOME/.ssh/matheus/id_rsa" ]; then
          chmod 600 "$HOME/.ssh/matheus/id_rsa"
        fi
      fi
      
      # Corrige permissões das chaves privadas do GitLab
      if [ -d "$HOME/.ssh/matheus-gitlab" ]; then
        chmod 700 "$HOME/.ssh/matheus-gitlab"
        if [ -f "$HOME/.ssh/matheus-gitlab/id_rsa_matheus_gitlab" ]; then
          chmod 600 "$HOME/.ssh/matheus-gitlab/id_rsa_matheus_gitlab"
        fi
      fi
    fi
  '';
}