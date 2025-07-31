
# Dockerfile: O Que É e Como Funciona

##  O que é um Dockerfile?

Um **Dockerfile** é um arquivo de texto que contém uma sequência de instruções que o Docker utiliza para **construir uma imagem personalizada de container**. 

---

## Por que usar um Dockerfile?

* Automatiza a criação de ambientes de desenvolvimento ou produção.
* Garante **reprodutibilidade** — todos usam o mesmo ambiente.
* Facilita o **deploy** em qualquer lugar que suporte Docker.
* Substitui o processo manual de instalação/configuração de dependências.

---

## Estrutura Básica

```dockerfile
# Define a imagem base
FROM node:18

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos da máquina local para a imagem
COPY package*.json ./
RUN npm install

COPY . .

# Expõe uma porta
EXPOSE 3000

# Comando padrão ao rodar o container
CMD ["npm", "start"]
```

---

## Instruções Comuns

| Instrução    | Descrição                                                  |
| ------------ | ---------------------------------------------------------- |
| `FROM`       | Define a imagem base. Obrigatório como primeira instrução. |
| `WORKDIR`    | Define o diretório de trabalho dentro da imagem.           |
| `COPY`       | Copia arquivos do host para a imagem.                      |
| `RUN`        | Executa comandos durante o build da imagem.                |
| `CMD`        | Define o comando padrão ao iniciar o container.            |
| `EXPOSE`     | Documenta a porta que a aplicação usa.                     |
| `ENV`        | Define variáveis de ambiente.                              |
| `ENTRYPOINT` | Define o executável principal da imagem.                   |
| `ARG`        | Define variáveis para uso durante o build.                 |
| `LABEL`      | Adiciona metadados à imagem.                               |
| `VOLUME`     | Cria pontos de montagem persistentes.                      |

>Main informações em [Palavras reservadas](../../docs/palavraDocker.md)
---

## Construindo e Rodando

```bash
# Build da imagem
docker build -t minha-imagem .

# Rodar o container
docker run -d -p 3000:3000 minha-imagem
```
> Mais informações em [Comandos](../../docs/comandos.md)
---

## Arquivo .dockerignore (exemplo)

```
node_modules
.git
.env
dist
```

> Similar ao `.gitignore`, evita que arquivos inúteis sejam copiados para a imagem.

---
