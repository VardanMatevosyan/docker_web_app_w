FROM maven:3.6.3-jdk-8 AS MAVEN_BUILD
MAINTAINER Matevosian Vardan
COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/
RUN mvn package
FROM openjdk:8-jdk
WORKDIR /app
COPY --from=MAVEN_BUILD /build/target/docker_wep_app_w.jar /app/
ENTRYPOINT ["java", "-jar", "docker_wep_app_w.jar"]