# ---- build stage ----
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -B -DskipTests clean package

# ---- run stage ----
FROM tomcat:9.0-jdk17-temurin

# optional: remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# deploy your WAR
COPY --from=build /app/target/mini-calculator-ben-yahav-ofir-roy.war /usr/local/tomcat/webapps/mini-calculator-ben-yahav-ofir-roy.war

# Tomcat listens on 8080 by default
EXPOSE 8080
CMD ["catalina.sh", "run"]