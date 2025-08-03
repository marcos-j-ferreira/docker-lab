# docker-lab
Meu objetivo é aprimorar o uso do Docker em diversos cenários, desde a criação de Dockerfiles até o uso com Kubernetes.

## Índice

Todos os conteúdos já estudados:

- [Comandos usados para build e run do Docker](#comandos-usados-para-build-e-run-do-docker)
- [Dockerfile: palavras reservadas](#palavras-reservadas-do-docker)
- [Volumes: como funcionam e como criar](#como-funciona-e-como-criar-um-volume)
- [Network: o que é, como configurar e iniciar](#como-configurar-iniciar-e-o-que-é-network-em-docker)

---

## Organização da Estrutura do Repositório

A estrutura do diretório está organizada por tópicos, de acordo com os assuntos estudados.

Cada pasta corresponde a um conceito principal do Docker (ex: `dockerfile/`, `volume/`, `network/`, etc.), contendo exemplos práticos, arquivos de configuração e comandos relacionados.

```
docker-lab/
│
├── README.md
├── .gitignore
│
├── 01-dockerfile/
│   ├── projeto-node/
│   │   ├── Dockerfile
│   │   └── app.js
│   └── projeto-python/
│       ├── Dockerfile
│       └── app.py
│
├── 02-volumes/
│   ├── com-volume-named/
│   ├── bind-mount/
│   └── dockerfile-volume/
│
├── 03-network/
│   ├── bridge/
│   └── macvlan/
│
├── 04-docker-compose/
│   ├── node-mongo/
│   │   ├── docker-compose.yml
│   │   ├── backend/
│   │   └── db/
│   └── nginx-proxy/
│       ├── docker-compose.yml
│
├── 05-docker-swarm/  # (opcional)
│   └── exemplo-cluster/
│
├── 06-kubernetes/  # (se/quando chegar aqui)
│   ├── pod.yaml
│   ├── deployment.yaml
│   └── service.yaml
```


# Docker Lab 

Este repositório contém experimentos práticos e anotações sobre o ecossistema Docker, desde fundamentos até orquestração com Docker Compose e Kubernetes.

## Estrutura

- `01-dockerfile/`: Exemplos básicos de `Dockerfile` com diversas linguagens.
- `02-volumes/`: Prática com volumes nomeados e bind mounts.
- `03-network/`: Comunicação entre containers via redes Docker.
- `04-docker-compose/`: Definição e execução de múltiplos containers.
- `05-docker-swarm/`: Conceitos iniciais de Swarm (opcional).
- `06-kubernetes/`: Orquestração com `kubectl`, Pods, Deployments etc.

## Como rodar os exemplos

Cada pasta contém um exemplo isolado. Acesse a pasta e execute:

```bash
docker build -t exemplo .
docker run -p 3000:3000 exemplo
````

Ou, no caso de `docker-compose`:

```bash
docker-compose up
```


## Boas práticas

1. **Separar bem os contextos:** Evite misturar volumes com rede, ou Compose com Dockerfile puro. Deixe cada pasta com seu objetivo.
2. **Evite copiar grandes projetos:** Crie mini projetos seus mesmo — isso te ajuda a entender melhor.
3. **Adicione anotações e scripts** se quiser documentar seus testes.
4. **Use Makefile ou scripts Bash** se quiser automatizar builds (`make build`, `make run`).
5. **Quando for pro Kubernetes**, evite ir direto pra GKE/EKS — pode usar o [Minikube](https://minikube.sigs.k8s.io/) ou [k3d](https://k3d.io/) localmente.

---

## Palavras reservadas do docker

Essas palavras são usadas para construir um dockerfile

> [Palavras Reservadas](./docs/palavraDocker.md)

---

## Comandos usados para build e run do docker

Esses comandos são usados para construir e rodar um dockerfile.

> [comandos](./docs/comandos.md)
---

## Como funciona e como criar um volume:

Esse arquivo contem as orientações sobre como trabalhar com volume

> [Volume](./docker-lab/02-volumes/docs.md) 

---

## Como configurar, iniciar e o que é network em Docker

Os seguites tópicos foram abordados e respondidos no:

>[network](./docker-lab/03-network/docs.md)