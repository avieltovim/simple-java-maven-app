FROM maven:3.8.1-openjdk-11-slim as builder

COPY src /usr/src/app/src
COPY pom.xml /usr/src/app

RUN mvn -f /usr/src/app/pom.xml clean package
'mvn -B -DbumpPatch clean package'
From openjdk:11.0.4-jre-slim



COPY --from=builder /usr/src/app/target/Calculator-1.0-SNAPSHOT.jar /usr/app/Calculator-1.0-SNAPSHOT.jar

ENTRYPOINT ["java", "-cp", "/usr/app/Calculator-1.0-SNAPSHOT.jar", "com.scalabledeveloper.multistagebuild.App"]
