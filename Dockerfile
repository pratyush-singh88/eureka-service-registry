FROM maven:3.6-jdk-8-alpine as build
ADD ./ app/
WORKDIR /app
RUN mvn clean install

COPY --from=build /app/target/eureka-registry-service.jar eureka-registry-service.jar
EXPOSE 8781
ENTRYPOINT ["java","-jar","-Dserver.port=9001","eureka-registry-service.jar"]