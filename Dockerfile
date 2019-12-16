FROM maven:3.6-jdk-8-alpine as build
ADD ./ app/
WORKDIR /app
RUN mvn clean install

FROM openjdk:8-jdk-alpine
COPY --from=build /app/target/eureka-server-0.0.1-SNAPSHOT.jar MM-eureka.jar
EXPOSE 8781
ENTRYPOINT ["java","-jar","-Dserver.port=9001","MM-eureka.jar"]