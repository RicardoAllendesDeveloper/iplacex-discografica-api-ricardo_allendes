# Stage 1: Construcción
FROM gradle:8.5-jdk17 AS build
WORKDIR /app
COPY . .
RUN gradle build -x test

# Stage 2: Ejecución
FROM openjdk:17
WORKDIR /app
COPY --from=build /app/build/libs/discografia-1.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]