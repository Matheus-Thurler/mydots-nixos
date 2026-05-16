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
      network-manager-vpn = {
        enabled = true;
        sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
      };
      kubectl-ctx = {
        enabled = true;
        sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
      };
      simple-notes = {
        enabled = true;
        sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
      };
      claude-code-panel = {
        enabled = true;
        sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
      };
      screen-toolkit = {
        enabled = true;
        sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
      };
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
