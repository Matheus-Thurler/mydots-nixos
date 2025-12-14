{ ... }:

{
  programs.git = {
    enable = true;
    # userEmail and userName are deprecated aliases
    # Using the new settings option directly:
    settings = {
      user = {
        name = "Matheus Thurler";
        email = "contato@matheusthurler.com.br";
      };
    };
  };
}