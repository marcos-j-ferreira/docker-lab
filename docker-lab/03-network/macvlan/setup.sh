#!/bin/bash


set -e


# criar um rede mac, e determinar o range dos ips
docker network create -d macvlan \
    --subnet=192.168.1.0/24  \
    --gateway=192.168.1.1  \
    -o parent=enp9s0  \
    minha-macvlan

# verificar a rede
docker network inspect minha-macvlan


#rodar
docker run -d \
    --name c-redeMac  \
    --network minha-macvlan  \
    --ip 192.168.1.100  \
    nginx


## criar um servidor web com ip especifico
docker run -d --name web-server \
    --network minha-macvlan    \
    --ip 192.168.1.200      \
    -p 80:80       \
    nginx
