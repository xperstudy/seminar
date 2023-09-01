FROM openjdk:8
RUN mkdir -p /app
COPY target/springbootapp2-1.0.jar /app
WORKDIR /app
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","springbootapp2-1.0.jar"]
