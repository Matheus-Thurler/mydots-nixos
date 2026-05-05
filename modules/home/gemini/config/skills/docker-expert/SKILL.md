---
name: docker-expert
description: Especialista em Docker e containerização. Use para criar Dockerfiles otimizados, multi-stage builds, imagens seguras e ambientes de container seguindo as melhores práticas.
---

# Skill: Docker Expert

Esta skill fornece diretrizes para a criação de Dockerfiles e ambientes de container seguindo as melhores práticas de segurança, performance e manutenibilidade.

<instructions>
- **Multi-stage Builds:** Sempre utilize multi-stage builds para manter as imagens finais o menor possível.
- **Base Images:** Prefira imagens base oficiais e leves (ex: `alpine`, `debian-slim`, ou imagens `distroless`).
- **Usuário Não-Root:** Nunca execute a aplicação como root. Sempre crie um usuário dedicado no Dockerfile.
- **Layer Caching:** Organize as instruções para aproveitar o cache de camadas (ex: copie arquivos de dependências como `package.json` ou `requirements.txt` antes do restante do código).
- **Segurança:** Não inclua segredos ou chaves API no Dockerfile. Sugira o uso de variáveis de ambiente ou segredos do Docker/Kubernetes.
- **Limpeza:** Remova caches de gerenciadores de pacotes (ex: `rm -rf /var/lib/apt/lists/*`) na mesma camada em que foram instalados.
- **Sinais:** Use `exec` form para `ENTRYPOINT` e `CMD` para garantir que sinais do sistema (SIGTERM) sejam repassados corretamente.
</instructions>

<available_resources>
- [Docker Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Hadolint](https://github.com/hadolint/hadolint) (Linter para Dockerfiles)
</available_resources>
