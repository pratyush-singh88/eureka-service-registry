FROM maven:3.6-jdk-8-alpine as build
ADD ./ app/
WORKDIR /app
RUN mvn clean install

COPY --from=build /app/target/eureka-server-0.0.1-SNAPSHOT.jar eureka-server-0.0.1-SNAPSHOT.jar
EXPOSE 8781
ENTRYPOINT ["java","-jar","-Dserver.port=9001","eureka-server-0.0.1-SNAPSHOT.jar"]