FROM openjdk:8-jre-alpine

LABEL maintainer "https://github.com/amq/"

ENV LESHAN_VERSION=1.0.0-M1

RUN mkdir -p /opt/leshan
ADD https://search.maven.org/remotecontent?filepath=org/eclipse/leshan/leshan-server-demo/${LESHAN_VERSION}/leshan-server-demo-${LESHAN_VERSION}.jar /opt/leshan/leshan.jar

EXPOSE 5683 5684 8080

WORKDIR /opt/leshan
ENTRYPOINT java -jar ./leshan.jar
