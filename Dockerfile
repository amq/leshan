FROM openjdk:8-jre-alpine

LABEL maintainer "https://github.com/amq/"

ENV LESHAN_VERSION=1.0.0-M1

RUN mkdir -p /opt/leshan
ADD https://hudson.eclipse.org/leshan/job/leshan/lastSuccessfulBuild/artifact/leshan-server-demo.jar /opt/leshan/

EXPOSE 5683 5684 8080

WORKDIR /opt/leshan
ENTRYPOINT ["java -jar ./leshan-server-demo.jar"]
