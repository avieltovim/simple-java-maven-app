FROM maven:3.8.6-openjdk-11-slim as builder

COPY src src/ 
COPY pom.xml .

RUN  mvn -B clean package

From openjdk:11.0.4-jre-slim

COPY --from=builder /target/*.jar ./java_app.jar

ENTRYPOINT ["java", "-jr", "java_app.jar"]
