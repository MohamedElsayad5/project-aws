# App Tier — Java Spring Boot (Multi-stage Build)
# ── Stage 1: Build ────────────────────────────────────────
FROM maven:3.9-eclipse-temurin-17-alpine AS builder
WORKDIR /build
#copy pom.xml and download dependencies to cache them
COPY pom.xml .
RUN mvn dependency:go-offline -B
#copy source code and build the application
COPY src/ ./src/
RUN mvn clean package -DskipTests -B
# ── Stage 2: Runtime ──────────────────────────────────────
FROM eclipse-temurin:17-jre-alpine
# Information about the Image
LABEL maintainer="DevOps Team"
LABEL version="1.0"
# Non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
# copy the JAR file from the builder stage
COPY --from=builder /build/target/*.jar app.jar
# change ownership
RUN chown appuser:appgroup app.jar
USER appuser
EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=60s --retries=3 \
  CMD wget -qO- http://localhost:8080/actuator/health || exit 1

ENV JAVA_OPTS="-Xms256m -Xmx512m -XX:+UseG1GC"

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]