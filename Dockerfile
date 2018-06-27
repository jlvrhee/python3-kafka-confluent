FROM python:3-alpine
MAINTAINER Jeroen van Rhee <jeroen.vanrhee@kpn.com>

RUN sed -i -e 's/v3\.4/edge/g' /etc/apk/repositories &&\
    apk upgrade --update-cache --available &&\
    apk add build-base &&\
    apk add --no-cache librdkafka &&\
    apk add --no-cache librdkafka-dev

ENV CPLUS_INCLUDE_PATH /usr/local/include
ENV LIBRARY_PATH /usr/local/lib
ENV LD_LIBRARY_PATH /usr/local/lib

RUN pip install confluent-kafka==0.9.4

WORKDIR /
