# Fish Functions
# Migrado do NixOS/myDots

function rebuild
    set -l host $argv[1]
    if test -z "$host"
        set host (hostname)
    end

    if not string match -q "nixos-*" "$host"
        echo "⚠️  Hostname '$host' não segue o padrão 'nixos-pc' ou 'nixos-laptop'."
        echo "💡 Tente: rebuild nixos-pc ou rebuild nixos-laptop"
        return 1
    end

    echo "🔨 Rebuilding NixOS for host: $host..."
    sudo nixos-rebuild switch --flake /home/matheus/mydots-nixos#$host --impure
end