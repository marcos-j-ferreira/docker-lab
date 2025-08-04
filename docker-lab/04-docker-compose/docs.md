## Docker Compose

O `docker-compose.yaml` define os serviços, volumes e redes utilizados pelo sistema.

---

### Comandos principais

| Comando                              | O que faz                                                   |
| ------------------------------------ | ----------------------------------------------------------- |
| `docker-compose up`                  | Sobe os containers (cria se necessário).                    |
| `docker-compose up -d`               | Sobe os containers em modo **detached** (em segundo plano). |
| `docker-compose up --build`          | Reconstrói as imagens antes de subir os containers.         |
| `docker-compose down`                | Para e remove containers, redes e volumes anônimos.         |
| `docker-compose build`               | Constrói as imagens sem subir os containers.                |
| `docker-compose ps`                  | Mostra os containers ativos.                                |
| `docker-compose logs`                | Exibe os logs dos containers.                               |
| `docker-compose exec <service> bash` | Entra no container do serviço para usar o terminal.         |

---

### Explicando o `docker-compose.yaml`

```yaml
version: "3.3"

services:
  app:
    build: .
    ports:
      - "5000:5000"
    volumes:
      - flask-data:/app/data
    networks:
      - rede-estudo

volumes:
  flask-data:

networks:
  rede-estudo:
```

#### Palavras-chave importantes

| Palavra-chave | Explicação                                                                     |
| ------------- | ------------------------------------------------------------------------------ |
| `version`     | Versão da sintaxe do Compose. Versões comuns: `"3.3"`, `"3"`, `"2.4"`          |
| `services`    | Define os **serviços** (containers) do sistema.                                |
| `build`       | Diz ao Compose para construir a imagem a partir do `Dockerfile`.               |
| `image`       | (Alternativa a `build`) Usa uma imagem existente.                              |
| `ports`       | Faz o mapeamento de portas: `host:container`.                                  |
| `volumes`     | Monta volumes no container. Pode ser persistente (nomeado) ou um path do host. |
| `networks`    | Define redes para os containers se comunicarem.                                |
| `depends_on`  | (Opcional) Define a ordem de inicialização dos serviços.                       |
