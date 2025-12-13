{ ... }:

{
  programs.git = {
    enable = true;
    userEmail = "contato@matheusthurler.com.br";
    userName = "Matheus Thurler";
    # Configuração antiga foi renomeada, mas Home Manager ainda aceita userEmail/userName como alias 
    # se não funcionar, mudar para:
    # extraConfig = { user = { name = ...; email = ...; }; };
    # Mas a warning diz para usar programs.git.userEmail -> settings...
    # Ajustando para o novo padrão se possível, ou mantendo simples se for alias.
    # O Warning diz: renamed to programs.git.settings.user.email
  };
}