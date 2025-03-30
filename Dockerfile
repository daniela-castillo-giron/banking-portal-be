FROM eclipse-temurin:17-jdk-alpine

ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Cloud Run injects PORT as env var, so expose it dynamically
ENV PORT=8080
EXPOSE 8080

ENTRYPOINT ["java", "-Dserver.port=${PORT}", "-jar", "app.jar"]
