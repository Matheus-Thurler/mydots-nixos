{ ... }:

{
  # Configuração de Plugins da Noctalia
  # Site oficial para explorar plugins: https://github.com/noctalia-dev/noctalia-plugins
  programs.noctalia-shell.plugins = {
    sources = [
      {
        enabled = true;
        name = "Noctalia Plugins";
        url = "https://github.com/noctalia-dev/noctalia-plugins";
      }
    ];
    states = {
      # Adicione aqui os plugins que você baixar, exemplo:
      # catwalk = {
      #   enabled = true;
      #   sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
      # };
    };
    version = 2;
  };

  # Configurações específicas de cada plugin podem ser feitas aqui:
  # programs.noctalia-shell.pluginSettings = {
  #   catwalk = {
  #     hideBackground = true;
  #   };
  # };
}
