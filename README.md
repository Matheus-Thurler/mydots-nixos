# 🚀 NixOS Modern Dots (Noctalia v4 + Illogical Style)

Este repositório contém minha configuração pessoal do NixOS, utilizando Flakes e Home Manager para um ambiente moderno, produtivo e esteticamente agradável.

## 🛠️ O que há de novo?

- **Noctalia Shell v4**: Interface moderna rodando sobre o **Hyprland**.
- **Illogical Style**: Terminal Kitty e Shell Fish customizados com efeitos visuais (cursor trail) e prompt Starship estilizado.
- **Modularização Total**: Configurações divididas em módulos reaproveitáveis (`gemini`, `ssh`, `terminal`, `shell`, etc).
- **Docker Ready**: Docker habilitado por padrão com usuário no grupo correto.
- **Fontes**: JetBrainsMono Nerd Font instalada para suporte a ícones.

---

## 💻 Como instalar em um novo PC

Se você estiver formatando ou instalando em outra máquina, siga estes passos:

### 1. Preparação
Certifique-se de que o NixOS está instalado com suporte a Flakes.

### 2. Clonar o Repositório
```bash
git clone git@github.com:seu-usuario/mydots-nixos.git ~/mydots-nixos
cd ~/mydots-nixos
```

### 3. Gerar Chave SSH (Se necessário)
Se não tiver uma chave no PC novo:
```bash
ssh-keygen -t ed25519 -C "matheusthurler@gmail.com"
# Adicione a chave pública (~/.ssh/id_ed25519.pub) ao GitHub
```

### 4. Aplicar a Configuração
Como este repositório usa Flakes e caminhos específicos:
```bash
sudo nixos-rebuild switch --flake . --impure
```

### 5. Finalizar a Sessão
Como o shell padrão e os grupos de usuário mudam, faça **Logout e Login**.

---

## 📂 Estrutura de Módulos

- `modules/home/gemini/`: Configurações do Gemini CLI (edite em `./config/`).
- `modules/home/terminal/`: Configuração do Kitty com efeito de rastro.
- `modules/home/shell/`: Fish + Starship (estilo Illogical).
- `modules/home/ssh/`: Gerenciamento de identidades SSH.
- `modules/nixos/nvidia/`: Drivers e tweaks para NVIDIA.

## 🤖 Gemini CLI & Skills

As instruções e regras do Gemini CLI agora estão centralizadas em `modules/home/gemini/config/`.
- Edite `GEMINI.md` para instruções globais.
- Adicione novas skills em `skills/` criando uma subpasta com um `SKILL.md`.

### 🔌 Gerenciando Extensões Gemini

Para instalar novas extensões (como `oh-my-gemini` ou `caveman`) sem que elas poluam o Git do seu repositório:

1.  **Instale a extensão:**
    ```bash
    gemini extensions install <URL-DO-GITHUB>
    ```
2.  **Extensões Complexas (Node.js/Build):**
    Se a extensão precisar de build (como o `oh-my-gemini`):
    ```bash
    cd ~/.gemini/extensions/<nome-da-extensao>
    npm install && npm run build
    # Opcional: Linkar o binário se ela tiver CLI próprio
    ln -sf $(pwd)/dist/cli/index.js ~/.npm-global/bin/<comando>
    ```
3.  **Não Commite:**
    O arquivo `.gitignore` já está configurado para ignorar a pasta `extensions/` e arquivos de credenciais/estado.

---

## ⌨️ Atalhos Úteis no Terminal

- `rebuild`: Atalho para o comando `nixos-rebuild switch`.
- `ls`, `ll`, `la`: Listagem de arquivos com ícones (via `eza`).
- `clear`: Limpa o terminal e o buffer de scrollback.
