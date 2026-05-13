# Stage 1: Configuración del entorno de construcción
FROM gradle:8.5-jdk17 AS build
WORKDIR /app
COPY . .
RUN gradle build -x test

# Stage 2: Configuración del entorno de ejecución
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/build/libs/discografia-1.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]