FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-Xmx128m", "-Xms64m", "-jar", "app.jar"]