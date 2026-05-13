# Stage 1: Construcción
FROM gradle:jdk17 AS build
WORKDIR /app
COPY . .
RUN gradle build -x test --no-daemon

# Stage 2: Ejecución
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/build/libs/discografia-1.war app.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.war"]