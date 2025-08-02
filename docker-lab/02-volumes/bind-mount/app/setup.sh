#!/bin/bash


set -e 

#para construir o contêiner:
docker build -t v-bind .


#para rodar o conteiner
docker run -d -v $(pwd)/data:/app/data --name volume-bind v-bind

