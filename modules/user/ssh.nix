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
}