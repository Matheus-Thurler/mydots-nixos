# 🚀 Início da Nova Configuração (Modern Dots)

Este documento registra o estado inicial ("Init") da sua nova jornada com NixOS Flakes e Home Manager, focada na **Noctalia Shell v4**.

## 🛠️ O que foi configurado (Ponto de Partida)

1.  **Arquitetura Flake**: O sistema agora é gerido por um `flake.nix` que trava as versões do sistema em **NixOS 25.11 (Estável)**.
2.  **Home Manager**: Integrado diretamente ao Flake para gerenciar suas configurações de usuário de forma modular.
3.  **Noctalia Shell v4**: Instalada e habilitada via Home Manager, com suporte a calendário e cache binário (Cachix) ativado para máxima performance.
4.  **Paridade de Sistema**: Seus aplicativos originais (Chrome, VS Code, Node.js) e configurações de hardware (NVIDIA, NetworkManager) foram preservados.

---

## 📂 Estrutura de Arquivos Atual

- `flake.nix`: O mestre. Gerencia as fontes e a união entre Sistema e Usuário.
- `configuration.nix`: Configurações de hardware, drivers e serviços de sistema (GNOME, GDM, Energia).
- `home.nix`: Onde vive a alma da sua interface. Atualmente controla a Noctalia Shell.
- `hardware-configuration.nix`: O mapa do seu hardware real.

---

## 🔄 Como Voltar para o GNOME Puro

Se você quiser desativar a Noctalia e voltar a usar apenas o GNOME padrão:

### Opção A: Reversão Temporária (Menu de Boot)
Ao ligar o PC, no menu do GRUB/Systemd-boot, selecione a **Generation** anterior. Isso te devolve ao sistema exatamente como estava antes de instalarmos a Noctalia.

### Opção B: Desativar no Código (Recomendado)
Se quiser manter o código mas não rodar a Noctalia:

1. Edite o arquivo `home.nix`.
2. Mude `enable = true;` para `enable = false;` dentro de `programs.noctalia-shell`.
3. Rode o rebuild:
   ```bash
   sudo nixos-rebuild switch --flake . --impure
   ```

### Opção C: Voltar ao Método Clássico (Emergência)
Se por algum motivo o Flake falhar, você sempre pode voltar ao seu backup original do sistema:
```bash
sudo nixos-rebuild switch -I nixos-config=/etc/nixos/configuration.nix
```

---

## ⌨️ Comandos Úteis

- **Aplicar Mudanças**: `sudo nixos-rebuild switch --flake . --impure`
- **Atualizar Versões**: `nix flake update`
- **Limpar Lixo**: `sudo nix-collect-garbage -d`
