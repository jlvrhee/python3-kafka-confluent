FROM python:3-alpine
MAINTAINER Jeroen van Rhee <jeroen.vanrhee@kpn.com>

ENV LIBRDKAFKA_VERSION 0.9.5
RUN curl -Lk -o /root/librdkafka-${LIBRDKAFKA_VERSION}.tar.gz https://github.com/edenhill/librdkafka/archive/v${LIBRDKAFKA_VERSION}.tar.gz && \
    tar -xzf /root/librdkafka-${LIBRDKAFKA_VERSION}.tar.gz -C /root && \
    cd /root/librdkafka-${LIBRDKAFKA_VERSION} && \
    ./configure && make && make install && make clean && ./configure --clean && \
    rm -rf /root/librdkafka-${LIBRDKAFKA_VERSION} /root/librdkafka-${LIBRDKAFKA_VERSION}.tar.gz

ENV CPLUS_INCLUDE_PATH /usr/local/include
ENV LIBRARY_PATH /usr/local/lib
ENV LD_LIBRARY_PATH /usr/local/lib

RUN pip install confluent-kafka==0.9.4

WORKDIR /
