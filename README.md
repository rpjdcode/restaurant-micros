

**RESTAURANT-MICROS**

---

Proyecto de arquitectura de microservicios, utilizando Docker para el despliegue de los servidores en una red de contenedores.

El objetivo de este proyecto es el desarrollo de una aplicación web en una arquitectura orientada a microservicios empleando las tecnologías más modernas y la versión estable más reciente posible de cada tecnología, siempre que la compatibilidad entre versiones lo permita.

La temática elegida para el desarrollo está relacionada con la hostelería, donde se intenta implementar una solución de aplicación para una cadena de restaurantes.

Repositorio de configuraciones de microservicios: https://github.com/rpjdcode/microservices-configuration

Repositorio de aplicación front-end para la arquitectura implementada: https://github.com/rpjdcode/restaurant-micros-front

---

**Compilación y despliegue del proyecto**

```
# Compilación del proyecto (generación de JARS de los microservicios)
mvn clean install
# Construcción de contenedores y despliegue
docker-compose up --build
```

---

**Tecnologías** utilizadas durante el desarrollo `back-end`

| TECNOLOGÍA   | VERSIÓN                      | DESCRIPCIÓN                                                  |
| ------------ | ---------------------------- | ------------------------------------------------------------ |
| Java         | 21                           | Lenguaje utilizado para el desarrollo                        |
| MySQL        | 8.0.36                       | Base de datos relacional                                     |
| Spring Boot  | 3.3.1                        | Desarrollo ágil de aplicaciones Spring                       |
| Spring Cloud | 2023.0.1                     | Desarrollo de aplicaciones orientadas a entornos de microservicios |
| Keycloak     | 24.0.3                       | Servidor de autenticación y autorización                     |
| Vault        | 1.13.3                       | Servidor gestor de claves y secretos                         |
| Zipkin       | Latest (pendiente de elegir) | Trazabilidad de peticiones web                               |
| MongoDB      | Latest (pendiente de elegir) | Base de datos documental                                     |



**Tecnologías** utilizadas durante el desarrollo `front-end`

| TECNOLOGÍA  | VERSIÓN | DESCRIPCIÓN                                                  |
| ----------- | ------- | ------------------------------------------------------------ |
| Angular     | 18.0.3  | Framework de desarrollo web                                  |
| TypeScript  | 5.4.2   | Lenguaje de programación implementada para el desarrollo     |
| Bootstrap   | 5.3.3   | Framework de desarrollo de interfaces web                    |
| keycloak-js | 24.0.3  | Biblioteca para la gestión de acceso autorizado con Keycloak |



---

**Microservicios**

| TECNOLOGÍA                  | NOMBRE                        | VERSIÓN |
| --------------------------- | ----------------------------- | ------- |
| Spring Cloud Config Server  | micro-config-server           | 0.0.1   |
| Eureka Discovery Server     | micro-eureka-discovery-server | 0.0.1   |
| Spring Cloud Gateway Server | micro-gateway-server          | 0.0.1   |
| Spring Cloud Reactive Web   | micro-reactivo-prueba         | -       |

---

**Dockerización del entorno**

Utilizar Docker en el desarrollo del proyecto es fundamental para lograr un despliegue rápido y confiable para los diferentes entornos (desarrollo, preproducción, producción).

En el caso de este proyecto, se utiliza Docker Compose, que permite definir y administrar aplicaciones multicontenedor.

Cada servidor será desplegado en su propio contenedor virtual, actualmente en una misma red virtual de contenedores (en un futuro, se recurrirá al Elastic Container de AWS para desplegar la aplicación, cuando la aplicación esté en un estado más avanzado de desarrollo).

---

