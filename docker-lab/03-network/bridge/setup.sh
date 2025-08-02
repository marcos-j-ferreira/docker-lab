#!/bin/bash

set -e 

#para criar uma rede
docker network create rede-estudo


#estou criando um contêiner com nginx
docker run -d --network rede-estudo --name app1 nginx

#estou criando um segundo contêiner para usar ping nele
docker run -d --network rede-estudo --name app2 alpine ping nginx


