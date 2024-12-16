# Proyecto Neo4j con Docker

Este proyecto tiene como objetivo proporcionar una configuración lista para usar de Neo4j mediante Docker. La solución permite a los desarrolladores levantar un entorno de base de datos orientada a grafos de forma rápida y consistente, ideal para pruebas, desarrollo y despliegues.

## Tecnologías Usadas

- ![Neo4j](https://img.shields.io/badge/Neo4j-008CC1?style=for-the-badge&logo=neo4j&logoColor=white)  
  Base de datos orientada a grafos que permite el modelado y análisis eficiente de relaciones.

- ![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)  
  Plataforma de contenedores que asegura un entorno consistente y portable para ejecutar Neo4j.

- ![Docker Compose](https://img.shields.io/badge/Docker%20Compose-2496ED?style=for-the-badge&logo=docker&logoColor=white)  
  Herramienta para definir y gestionar aplicaciones multi-contenedor de manera declarativa.

## Requisitos Previos

1. Tener instalado Docker y Docker Compose. Puedes descargarlos desde los siguientes enlaces:

   - [Docker](https://www.docker.com/products/docker-desktop)
   - [Docker Compose](https://docs.docker.com/compose/install/)

2. Acceso a un terminal o consola para ejecutar los comandos.

## Instalación y Configuración

### Clonar el Repositorio

Primero, clona este repositorio en tu máquina local:

```bash
git clone https://github.com/Troy8203/Defesan272-Neo4j.git
cd neo4j-docker-project
```

### Levantar los Contenedores

Ejecuta el siguiente comando para iniciar Neo4j:

```bash
docker-compose up -d
```

Esto levantará los contenedores en segundo plano. Puedes verificar que el servicio está corriendo con:

```bash
docker ps
```

### Acceso a Neo4j

Una vez que los contenedores estén corriendo, puedes acceder a la interfaz web de Neo4j en:

[http://localhost:7474](http://localhost:7474)

- Usuario: `neo4j`
- Contraseña: `strongpassword123`

### Creación de Grafo

```cql
CREATE (a: Jugador {nombre: "Lionel Messi"}),
    (b: Equipo {nombre: "Barcelona"})
WITH a, b
CREATE (a)-[n: JuegaPara]->(b)
SET n. since=date("2001-02-01")
RETURN a, n, b
```

[![image.png](https://i.postimg.cc/L6tzVZyy/image.png)](https://postimg.cc/rKp0Vz2W)

### Base de Datos Amigos

Creación de base de datos con grafos de cada amigo

```cql
CREATE (rob: Person{name: 'Roberto'}),
    (isidro: Person{name: 'Isidro'}),
    (tony: Person{name: 'Antonio'}),
    (nora: Person{name: 'Nora'}),
    (lily: Person{name: 'Lilian'}),
    (freddy: Person{name: 'Alfredo'}),
    (lucas: Person{name: 'Lucas'}),
    (mau: Person{name: 'Mauricio'}),
    (alb:Person{name: 'Albina'}),
    (reg: Person{name: 'Regina'}),
    (j: Person{name: 'Joaquín'}),
    (julian: Person{name: 'Julián'})

CREATE (rob)-[:Friendswith]->(isidro),
    (rob)-[:Friendswith]->(tony),
    (rob)-[:Friendswith]->(reg),
    (rob)-[:Friendswith]->(mau),
    (rob)-[:Friendswith]->(julian),
    (tony)-[:Friendswith]->(reg),
    (tony)-[: Friendswith]->(j),
    (alb)-[:Friendswith]->(reg),
    (lily)-[:Friendswith]->(isidro),
    (lily)-[:Friendswith]->(j),
    (mau)-[:Friendswith]->(lucas),
    (lucas)-[:Friendswith]->(nora),
    (freddy)-[: Friendswith]->(nora);
```

Mostrar los Datos

```cql
MATCH friendships=()-[:Friendswith]-()
RETURN friendships
```

[![image.png](https://i.postimg.cc/QtBXX19h/image.png)](https://postimg.cc/ZBSkH9xM)

Listado de amigos de amigos

```cql
MATCH (n)-[:Friendswith*2]-(fof)
WHERE n.name = 'Roberto'
RETURN n.name AS Person, fof.name AS FriendOfFriend;
```

[![image.png](https://i.postimg.cc/y8csxcTT/image.png)](https://postimg.cc/xXfWFkhk)
