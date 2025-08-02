# Docker Volume

Volumes em Docker são usados para **persistir dados** gerados e utilizados pelos containers, mesmo após eles serem **parados ou destruídos**. Isso é essencial, por exemplo, para armazenar bancos de dados, arquivos de configuração ou logs.

Existem diferentes abordagens para se trabalhar com volumes, dependendo da necessidade de gerenciamento e localização dos dados.

---

## Comandos úteis com Volumes

```bash
# Criar um volume nomeado
docker volume create nome_do_volume

# Listar volumes
docker volume ls

# Inspecionar um volume
docker volume inspect nome_do_volume

# Remover um volume
docker volume rm nome_do_volume

# Remover todos os volumes não utilizados
docker volume prune
```

---

## Como criar e utilizar um volume

Você pode criar um volume de duas formas principais:

### Exemplo 1: Usando um volume nomeado

```bash
docker volume create meu_volume
docker run -v meu_volume:/app/data nome_da_imagem
```

### Exemplo 2: Usando um bind mount (diretório do host)

```bash
docker run -v $(pwd)/dados:/app/data nome_da_imagem
```

---

## Abordagens

### 1. Volume gerenciado pelo Docker

Neste caso, o Docker cuida da criação e armazenamento do volume de forma automática. Os dados são armazenados em uma pasta interna do Docker (geralmente em `/var/lib/docker/volumes`).

#### Exemplo:

```bash
docker run -v meu_volume:/app/data nome_da_imagem
```

 **Vantagens:**

* Menor risco de conflitos com permissões.
* Separação clara dos dados do container e do sistema do host.

---

### 2. Bind Mount: Volume no diretório do host

Esta abordagem permite armazenar os dados diretamente em uma pasta local do host, facilitando o acesso, backup e edição direta dos arquivos.

#### Exemplo:

```bash
docker run -v $(pwd)/dados:/app/data nome_da_imagem
```

 Os dados ficarão salvos na pasta `dados` no diretório atual.

 **Vantagens:**

* Fácil acesso e edição dos arquivos pelo host.
* Útil durante o desenvolvimento.

 **Atenção:** Pode haver problemas com permissões dependendo do SO e do usuário que roda o Docker.

---

## Como visualizar os dados armazenados

### Opção 1: Usando um container Alpine temporário

Você pode montar o volume em um container simples para inspecionar os dados.

```bash
docker run --rm -it -v meu_volume:/data alpine sh
cd /data
ls
```

### Opção 2: Acessar diretamente a pasta (no caso de bind mount)

Se você usou `$(pwd)/dados`, basta acessar essa pasta diretamente:

```bash
cd dados
ls
```

### Opção 3: Entrar no container em execução

```bash
docker exec -it nome_do_container sh
cd /app/data
ls
```

