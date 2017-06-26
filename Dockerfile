FROM node:8.1.0

RUN apt-get update \
  && apt-get install -y apt-transport-https \
  && apt-get clean

ENV HOME=/home/node
RUN groupadd -r node && useradd -r -g node --create-home node
