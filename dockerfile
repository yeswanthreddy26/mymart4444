FROM maven:3.8.7-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests
FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
