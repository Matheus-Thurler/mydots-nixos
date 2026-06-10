# Fish Shell Configuration
# Migrado do NixOS/myDots

# Desabilitar saudação
set fish_greeting

# Adicionar npm global bin ao PATH
fish_add_path -a $HOME/.npm-global/bin

# API para Claude/Claude Code
set -gx ANTHROPIC_BASE_URL https://api.aibee.cloud

# Starship Transience - prompt transiente
function starship_transient_prompt_func
    starship module character
end

# Inicializar starship (somente fora do tty)
if test "$TERM" != "linux"
    starship init fish | source
    enable_transience
end