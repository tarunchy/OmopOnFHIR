#Build the Maven project
FROM maven:3.6.1-alpine as builder
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN mvn clean install

#Build the Tomcat container
FROM tomcat:alpine
#set environment variables below and uncomment the line. Or, you can manually set your environment on your server.
#ENV JDBC_URL=jdbc:postgresql://<host>:<port>/<database> JDBC_USERNAME=<username> JDBC_PASSWORD=<password>

ENV JDBC_URL=jdbc:postgresql://192.168.86.40:5432/omop JDBC_USERNAME=postgres JDBC_PASSWORD=password SERVERBASE_URL=http://192.168.86.40:8080/omoponfhir4
RUN apk update
RUN apk add zip postgresql-client

# Copy GT-FHIR war file to webapps.
COPY --from=builder /usr/src/app/omoponfhir-r4-server/target/omoponfhir-r4-server.war $CATALINA_HOME/webapps/omoponfhir4.war

EXPOSE 8080
