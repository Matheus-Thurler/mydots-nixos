{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    # Nova estrutura do Home Manager Unstable
    settings = {
      user = {
        name = "Matheus Thurler";
        email = "matheusthurlernf@gmail.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
