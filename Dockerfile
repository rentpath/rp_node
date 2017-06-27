FROM node:8.1.2

RUN apt-get update \
  && apt-get install -y apt-transport-https \
  && apt-get clean

ENV HOME=/home/node
