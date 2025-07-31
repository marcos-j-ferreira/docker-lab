#!/bin/bash

set -e

# Nome base do diretório
BASE_DIR="docker-lab"

# Criando a estrutura de diretórios
mkdir -p $BASE_DIR/{01-dockerfile/{projeto-node,projeto-python},\
02-volumes/{com-volume-named,bind-mount,dockerfile-volume},\
03-network/{bridge,custom-network},\
04-docker-compose/{node-mongo/backend,node-mongo/db,nginx-proxy},\
05-docker-swarm/exemplo-cluster,\
06-kubernetes}

# Criando arquivos iniciais (vazios ou exemplos)
touch $BASE_DIR/README.md
touch $BASE_DIR/.gitignore

echo "Estrutura de diretórios criada com sucesso dentro de $BASE_DIR"
