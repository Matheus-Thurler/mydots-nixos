# Teste do wrapper claude (docker exec)

## Contexto
Wrapper `claude` foi reescrito para usar `docker exec` em vez de `distrobox enter`.
Problema anterior: `distrobox enter` bloqueava pedindo senha em processos não-interativos.

## Lógica atual do wrapper
```bash
if [ "$CONTAINER_ID" = "claude-box" ]; then
  # já dentro do container — chama binário direto com bash como shell
  exec env SHELL=/bin/bash /usr/local/bin/claude "$@"
elif [ -t 0 ]; then
  # terminal interativo — aloca TTY
  exec docker exec -it -e SHELL=/bin/bash claude-box /usr/local/bin/claude "$@"
else
  # sem TTY (subcomando, pipe, IDE) — sem -t
  exec docker exec -i -e SHELL=/bin/bash claude-box /usr/local/bin/claude "$@"
fi
```

## O que testar

### 1. Uso interativo (terminal fish)
```fish
claude
```
Esperado: abre normalmente, prompt interativo aparece.

### 2. Bash tools funcionando dentro do claude
Dentro de uma sessão claude, pede pra rodar um comando simples:
```
rode: echo "ok" && whoami
```
Esperado: retorna output sem bloquear, sem pedir senha, sem erro de stdin.

### 3. Subcomando não-interativo
```fish
echo "qual é 2+2?" | claude --print
```
Esperado: responde sem erro de stdin.

### 4. Verificar SHELL dentro do container
Dentro do claude, pede:
```
rode: echo $SHELL
```
Esperado: `/bin/bash` (não fish).

## Arquivo modificado
`modules/home/distrobox/default.nix`
