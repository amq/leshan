FROM openjdk:8-jre-alpine

LABEL maintainer "https://github.com/amq/"

RUN mkdir -p /opt/leshan
ADD https://hudson.eclipse.org/leshan/job/leshan/lastSuccessfulBuild/artifact/leshan-server-demo.jar /opt/leshan/
ADD https://hudson.eclipse.org/leshan/job/leshan/lastSuccessfulBuild/artifact/leshan-client-demo.jar /opt/leshan/

RUN apk update \
    && apk add --no-cache -u python py-pip \
    && pip install supervisor

COPY supervisord.conf /etc/supervisord.conf
 
EXPOSE 8080
EXPOSE 5683/udp
EXPOSE 5684/udp

WORKDIR /opt/leshan
CMD ["supervisord", "--configuration", "/etc/supervisord.conf"]
