{ ... }:

{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "matheus" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/matheus/id_rsa";
        identitiesOnly = true;
      };
      
      "ezops" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/ezops/id_rsa";
        extraOptions = { PreferredAuthentications = "publickey"; };
      };

      "gitlab.com" = {
        hostname = "gitlab.com";
        user = "git";
        identityFile = "~/.ssh/matheus-gitlab/id_rsa_matheus_gitlab";
        extraOptions = { PreferredAuthentications = "publickey"; };
      };

      "ezops-ohio-mail-server" = {
        hostname = "ec2-3-16-161-106.us-east-2.compute.amazonaws.com";
        user = "ubuntu";
        identityFile = "~/.ssh/matheus-ohio.pem";
      };

      "bitbucket.org" = {
        hostname = "bitbucket.org";
        user = "git";
        identityFile = "~/.ssh/sobol/id_rsa";
        extraOptions = { PreferredAuthentications = "publickey"; };
      };
    };
  };
}