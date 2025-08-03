# Docker Network

O Docker permite configurar redes personalizadas para os containers, possibilitando o isolamento, criação de sub-redes, definição de gateways, e outras configurações de rede mais avançadas.

> Existem diversos tipos de redes no Docker, mas os mais comuns são: `bridge`, `host`, `none`, `macvlan` e `overlay`. Algumas são mais usadas em ambientes de desenvolvimento, outras são voltadas para produção.

---

## Bridge

A rede `bridge` é o modo padrão usado quando você cria containers sem especificar uma rede. Ela cria uma rede virtual privada onde os containers podem se comunicar entre si.

É útil quando você quer isolar a comunicação entre containers e controlar o mapeamento de portas para acesso externo.

### Exemplo em código

```bash
# Criar uma rede bridge personalizada
docker network create --driver bridge minha-bridge

# Rodar dois containers na mesma rede
docker run -dit --name container1 --network minha-bridge alpine sh
docker run -dit --name container2 --network minha-bridge alpine sh

# Conectar do container1 para o container2
docker exec -it container1 ping container2
````

---

## Host

Ao usar a rede `host`, o container compartilha o namespace de rede do host. Isso significa que ele usará diretamente o IP da máquina física e não terá isolamento de rede.

É útil para aplicações que precisam de máximo desempenho de rede ou que requerem acesso direto à rede do host.

> Não é suportado no Docker Desktop (Mac/Windows), apenas em Linux.

### Exemplo em código

```bash
docker run --rm -it --network host alpine sh

# Nesse modo, o container já tem acesso direto à rede do host
```

---

## None

O modo `none` desativa completamente a rede do container. O container é iniciado sem interface de rede.

Esse modo é útil quando você precisa de um container totalmente isolado da rede ou quer configurar a rede manualmente com ferramentas avançadas.

### Exemplo em código

```bash
docker run --rm -it --network none alpine sh

# Você verá que não há conectividade com a internet nem com outros containers
```

---

## Macvlan

A rede `macvlan` permite atribuir endereços IP diretamente aos containers a partir da sub-rede da rede física. Isso faz com que cada container apareça como um dispositivo na rede física.

É útil quando os containers precisam ser tratados como dispositivos separados na rede (por exemplo, serviços legados que só aceitam IPs estáticos ou precisam de visibilidade direta na rede).

### Exemplo em código

```bash
# Criar uma interface macvlan (exemplo: eth0 é a interface real da sua máquina)
docker network create -d macvlan \
  --subnet=192.168.1.0/24 \
  --gateway=192.168.1.1 \
  -o parent=eth0 \
  macvlan-net

# Rodar um container com IP da sub-rede
docker run -dit --name macvlan-container --network macvlan-net alpine sh
```

>  Importante: O container não conseguirá se comunicar diretamente com o host por padrão. Isso precisa ser configurado separadamente.

---

## Overlay

A rede `overlay` é usada principalmente com Docker Swarm para permitir a comunicação entre containers em hosts diferentes. Ela cria uma rede virtual sobre a rede física.

É ideal para aplicações distribuídas que rodam em clusters.

### Exemplo em código

```bash
# Inicializar o Docker Swarm
docker swarm init

# Criar uma rede overlay
docker network create -d overlay --attachable minha-overlay

# Rodar containers conectados à rede overlay (em um serviço ou container standalone)
docker service create --name web --network minha-overlay nginx
```

---

## Considerações Finais

| Tipo de Rede | Ideal para                    | Isolamento | Comunicação com Host  | Produção          |
| ------------ | ----------------------------- | ---------- | --------------------- | ----------------- |
| `bridge`     | Containers locais             | Médio      | Controlado via portas | Sim               |
| `host`       | Alto desempenho               | Baixo      | Total                 | Sim (Linux)       |
| `none`       | Containers isolados           | Total      | Nenhuma               | Casos específicos |
| `macvlan`    | Containers com IP fixo na LAN | Alto       | Manual                | Sim               |
| `overlay`    | Containers em múltiplos hosts | Alto       | Sim                   | Sim (Swarm)       |



```bash

# Inicializar o Docker Swarm 
docker swarm init

## Criar uma rede overlay
docker network create -d overlay minha-rede-overlay

## Criar um serviço conectado à rede overlay
docker service create --name meu-servico --network minha-rede-overlay nginx

```

A rede minha-rede-overlay permite que os containers em diferentes nós do Swarm se comuniquem como se estivessem na mesma rede.

## Considerações Finais

Bridge é ideal para comunicação isolada entre containers no mesmo host.
Host é útil para alta performance, mas cuidado com conflitos de portas.
None é perfeito para máxima segurança e isolamento.
Macvlan oferece flexibilidade para cenários que requerem IPs dedicados.
Overlay é essencial para aplicações distribuídas em múltiplos hosts com Docker Swarm.

Escolha o tipo de rede com base nas necessidades do seu projeto, considerando fatores como segurança, desempenho e escalabilidade.

---