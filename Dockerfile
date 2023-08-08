FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY pom.xml pom.xml
COPY jpa jpa
COPY backend_generated_app_edb8c6a1_1e90_42e0_8b06_cb6eb6d53d34 backend_generated_app_edb8c6a1_1e90_42e0_8b06_cb6eb6d53d34
RUN mvn clean package -DnoTest=true

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/backend_generated_app_edb8c6a1_1e90_42e0_8b06_cb6eb6d53d34/target/generated_app-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar generated_app-0.0.1-SNAPSHOT.jar"]