#Huddersfield Respect#

@Author - Jonathan Sterling

##Framework##
Spring Boot

##Live Demo##
https://huddersfieldrespect.co.uk

##Running Locally##
Add an application.properties file to the root of the /src/main/resources directory.  Here's an example:
```
server.port=8082

spring.jpa.database=POSTGRESQL
spring.datasource.platform=postgres
spring.jpa.show-sql=false
spring.jpa.hibernate.ddl-auto=none
spring.jpa.generate-ddl=false
spring.database.driverClassName=org.postgresql.Driver
spring.datasource.url=jdbc:postgresql://localhost:5432/respect
spring.datasource.username=postgres
spring.datasource.password=postgres

spring.thymeleaf.cache=false
spring.mvc.favicon.enabled=true

mailgun.api.key=key-ed5efee53f1ac780c58c73643fde2733
```
