FROM openjdk:8u212-jdk
RUN mkdir -p /app
COPY target/demoapp1-1.0.jar /app
WORKDIR /app

COPY docker/entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/entrypoint.sh /entrypoint.sh # backwards compat
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 8888
CMD ["java","-Djava.security.egd=file:/dev/./urandom","-jar","demoapp1-1.0.jar"]