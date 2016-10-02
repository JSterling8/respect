#Huddersfield Respect#

@Author - Jonathan Sterling

##Framework##
Spring Boot

##Live Demo##
https://huddersfieldrespect.co.uk  
You can login with a@a.com/tester

##Running Locally##
Add an application.properties file to the root of the /src/main/resources directory.  Here's an example:
```
server.port=PORT

spring.jpa.database=POSTGRESQL
spring.datasource.platform=postgres
spring.jpa.show-sql=false
spring.jpa.hibernate.ddl-auto=update
spring.jpa.generate-ddl=false
spring.database.driverClassName=org.postgresql.Driver
spring.datasource.url=jdbc:postgresql://localhost:5432/DBNAME
spring.datasource.username=USER
spring.datasource.password=PASS
spring.datasource.testOnBorrow=true
spring.datasource.validationQuery=SELECT 1

spring.thymeleaf.cache=false
spring.mvc.favicon.enabled=true

mailgun.api.key=YOURKEY
```
Create a PostgreSQL database (Spring will create the tables for you)

Build the application by opening a command line and executing 'mvn clean package'

Change to the /target directory and run the command 'java -jar respect-1.0-SNAPSHOT.jar
