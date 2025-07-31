### 1. **Construir uma imagem**

```bash
docker build -t nome-da-imagem .
```

* `-t` define um nome/tag para a imagem.
* `.` indica que o `Dockerfile` está no diretório atual.

---

### 2. **Listar imagens**

```bash
docker images
```

---

### 3. **Rodar um container**

```bash
docker run nome-da-imagem
```

Exemplo com porta e nome:

```bash
docker run -d -p 3000:3000 --name meu-container nome-da-imagem
```

* `-d`: executa em segundo plano (detached)
* `-p`: mapeia portas (host\:container)
* `--name`: dá um nome ao container

---

### 4. **Ver containers ativos**

```bash
docker ps
```

### 5. **Ver todos containers (inclusive parados)**

```bash
docker ps -a
```

---

### 6. **Parar um container**

```bash
docker stop nome-ou-id
```

---

### 7. **Remover um container**

```bash
docker rm nome-ou-id
```

---

### 8. **Remover uma imagem**

```bash
docker rmi nome-da-imagem
```
