# Comandos do Dockerfile

Este documento descreve as principais instruções utilizadas em um `Dockerfile` — o arquivo responsável por definir como será construída a imagem de um container Docker.

---

##  Principais Instruções

### `FROM`

* **Descrição**: Define a imagem base para o seu container.
* **Exemplo**:

  ```dockerfile
  FROM node:18
  ```
* **O que faz**: Indica que a imagem será baseada na imagem oficial do Node.js versão 18.

---

### `COPY`

* **Descrição**: Copia arquivos ou diretórios do seu sistema local para a imagem Docker.
* **Exemplo**:

  ```dockerfile
  COPY . /app
  ```
* **O que faz**: Copia todo o conteúdo do diretório atual para o diretório `/app` dentro da imagem.

---

### `WORKDIR`

* **Descrição**: Define o diretório de trabalho dentro da imagem.
* **Exemplo**:

  ```dockerfile
  WORKDIR /app
  ```
* **O que faz**: A partir dessa instrução, todos os comandos seguintes (como `RUN`, `CMD`, etc.) serão executados dentro de `/app`.

---

### `RUN`

* **Descrição**: Executa comandos durante a construção da imagem.
* **Exemplo**:

  ```dockerfile
  RUN npm install
  ```
* **O que faz**: Executa `npm install` enquanto a imagem está sendo criada (build time).

---

### `CMD`

* **Descrição**: Define o comando padrão a ser executado quando o container iniciar.
* **Exemplo**:

  ```dockerfile
  CMD ["node", "server.js"]
  ```
* **O que faz**: Quando o container é iniciado, ele executa `node server.js`.

---

### `EXPOSE`

* **Descrição**: Indica a porta na qual o container vai "ouvir".
* **Exemplo**:

  ```dockerfile
  EXPOSE 3000
  ```
* **O que faz**: Informa que o container espera receber conexões na porta 3000 (não publica a porta, apenas documenta).

---

### `ENV`

* **Descrição**: Define variáveis de ambiente dentro do container.
* **Exemplo**:

  ```dockerfile
  ENV NODE_ENV=production
  ```
* **O que faz**: Define a variável de ambiente `NODE_ENV` como `production`.

---

### `ENTRYPOINT`

* **Descrição**: Define o executável principal do container (semelhante ao `CMD`, mas mais rígido).
* **Exemplo**:

  ```dockerfile
  ENTRYPOINT ["npm", "start"]
  ```
* **O que faz**: Sempre executará `npm start`, mesmo se argumentos forem passados ao container.

---

### `ARG`

* **Descrição**: Define variáveis para uso durante a **construção** da imagem.
* **Exemplo**:

  ```dockerfile
  ARG APP_VERSION=1.0
  ```
* **O que faz**: Permite usar `APP_VERSION` como variável no build (ex: `RUN echo $APP_VERSION`).

---

### `VOLUME`

* **Descrição**: Cria um ponto de montagem de volume persistente.
* **Exemplo**:

  ```dockerfile
  VOLUME /data
  ```
* **O que faz**: Cria um volume em `/data` que pode ser persistido fora do container.

---

### `LABEL`

* **Descrição**: Adiciona metadados à imagem.
* **Exemplo**:

  ```dockerfile
  LABEL maintainer="seu_nome@example.com"
  ```
* **O que faz**: Adiciona informações sobre o autor, versão, etc.

---

>exemplo de um dockerfile [Node](../docker-lab/01-dockerfile/projeto-node/Dockerfile)