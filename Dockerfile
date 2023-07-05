FROM maven:3.8.6-openjdk-11-slim as builder

COPY src pom.xml .

RUN  mvn -B -f pom.xml -DbumpPatch clean package

From openjdk:11.0.4-jre-slim

COPY --from=builder /target/*.jar ./java_app.jar

ENTRYPOINT ["java", "-cp", "java_app.jar", "com.scalabledeveloper.multistagebuild.App"]
