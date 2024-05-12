**RESTAURANT-MICROS**

---

Proyecto de arquitectura de microservicios, utilizando Docker para el despliegue de los servidores en una red de contenedores.

El objetivo de este proyecto es el desarrollo de una aplicación web en una arquitectura orientada a microservicios empleando las tecnologías más modernas y la versión estable más reciente posible de cada tecnología, siempre que la compatibilidad entre versiones lo permita.

La temática elegida para el desarrollo está relacionada con la hostelería, donde se intenta implementar una solución de aplicación para una cadena de restaurantes.

---

**Compilación y despliegue del proyecto**

```
# Compilación del proyecto (generación de JARS de los microservicios)
mvn clean install
# Construcción de contenedores y despliegue
docker-compose up --build
```

---

**Tecnologías**

| TECNOLOGÍA   | VERSIÓN                      | DESCRIPCIÓN                                                  |
| ------------ | ---------------------------- | ------------------------------------------------------------ |
| Java         | 21                           | Lenguaje utilizado para el desarrollo                        |
| MySQL        | 8.0.36                       | Base de datos relacional                                     |
| Spring Boot  | 3.2.5                        | Desarrollo ágil de aplicaciones Spring                       |
| Spring Cloud | 2023.0.1                     | Desarrollo de aplicaciones orientadas a entornos de microservicios |
| Keycloak     | 24.0.3                       | Servidor de autenticación y autorización                     |
| Vault        | Latest (pendiente de elegir) | Servidor gestor de claves y secretos                         |
| Zipkin       | Latest (pendiente de elegir) | Trazabilidad de peticiones web                               |

---

**Microservicios**

| TECNOLOGÍA                 | NOMBRE                        | VERSIÓN |
| -------------------------- | ----------------------------- | ------- |
| Spring Cloud Config Server | micro-config-server           | 0.0.1   |
| Eureka Discovery Server    | micro-eureka-discovery-server | 0.0.1   |

---

**Dockerización del entorno**

Utilizar Docker en el desarrollo del proyecto es fundamental para lograr un despliegue rápido y confiable para los diferentes entornos (desarrollo, preproducción, producción).

En el caso de este proyecto, se utiliza Docker Compose, que permite definir y administrar aplicaciones multicontenedor.

Cada servidor será desplegado en su propio contenedor virtual, actualmente en una misma red virtual de contenedores (en un futuro, se recurrirá al Elastic Container de AWS para desplegar la aplicación, cuando la aplicación esté en un estado más avanzado de desarrollo).

![image-20240512230001052](C:\Users\Ruben\AppData\Roaming\Typora\typora-user-images\image-20240512230001052.png)

---

