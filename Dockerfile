FROM openjdk:17-jdk-alpine
VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
COPY build/libs/configService-0.0.1-SNAPSHOT.jar configservice.jar
EXPOSE 8888
#ENTRYPOINT exec java $JAVA_OPTS -jar discoveryservice.jar
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar configservice.jar