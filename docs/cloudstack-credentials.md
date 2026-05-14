# CloudStack Credentials Setup

O módulo `modules/home/packages/cloudmonkey.nix` espera variáveis de ambiente para autenticação no CloudStack.

## Variáveis necessárias

```bash
export CLOUDSTACK_API_URL="http://10.0.30.248:8080/client/api"
export CLOUDSTACK_API_KEY="sua-api-key"
export CLOUDSTACK_SECRET_KEY="sua-secret-key"
```

## Como configurar

Crie o arquivo `~/.config/cloudstack/env`:

```bash
mkdir -p ~/.config/cloudstack
cat > ~/.config/cloudstack/env << 'EOF'
export CLOUDSTACK_API_URL="http://10.0.30.248:8080/client/api"
export CLOUDSTACK_API_KEY="sua-api-key"
export CLOUDSTACK_SECRET_KEY="sua-secret-key"
EOF
chmod 600 ~/.config/cloudstack/env
```

## Carregar automaticamente no Fish

Adicione ao seu `~/.config/fish/conf.d/cloudstack.fish`:

```fish
if test -f ~/.config/cloudstack/env
    export (grep -v '^#' ~/.config/cloudstack/env | xargs -L 1)
end
```

Ou source manualmente quando precisar:

```fish
export (grep -v '^#' ~/.config/cloudstack/env | xargs -L 1)
```

## Uso

Após configurar, os aliases `cmk` e `cloudmonkey` funcionam automaticamente passando as credenciais.
