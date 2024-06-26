FROM maven:3.8.7-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml /app/
COPY . /app/
RUN mvn clean package -DskipTests
FROM openjdk:17-jdk-alpine
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
