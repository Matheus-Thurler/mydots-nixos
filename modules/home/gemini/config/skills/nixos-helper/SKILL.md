# Skill: NixOS Helper

Esta skill fornece diretrizes especializadas para gerenciar esta configuração NixOS específica.

<instructions>
- Sempre verifique o arquivo `GEMINI.md` na raiz antes de sugerir mudanças estruturais.
- Ao sugerir novos pacotes, verifique se eles devem ir para `configuration.nix` (sistema) ou `modules/home/packages/default.nix` (usuário).
- Prefira sempre a modularização: se uma configuração crescer demais, sugira criar um novo arquivo em `modules/`.
- Após qualquer mudança em arquivos `.nix`, lembre o usuário de rodar o comando `rebuild`.
- Mantenha os comentários em português, seguindo o padrão atual do repositório.
</instructions>

<available_resources>
- `configuration.nix`: Configurações de hardware e sistema.
- `home.nix`: Ponto de entrada do Home Manager.
- `modules/`: Pasta com todos os módulos customizados.
</available_resources>
