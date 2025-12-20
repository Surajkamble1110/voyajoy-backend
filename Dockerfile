# Stage 1: Build
FROM eclipse-temurin:17-jdk as build
WORKDIR /app
COPY . .
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Stage 2: Run
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 9090
CMD ["sh", "-c", "java -Dserver.port=${PORT:-9090} -Xmx256m -jar app.jar"]