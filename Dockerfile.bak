FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
EXPOSE 9090
CMD ["java","-Dserver.port=$PORT","-jar","target/*.jar"]
