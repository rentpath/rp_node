FROM node:6.10.2-alpine

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories

# Install yarn for app and compile deps for native
RUN apk add --no-cache yarn git make gcc g++ python libx11-dev libxi-dev libxext-dev mesa-dev
RUN yarn global add node-gyp gl

ENV HOME=/home/node
ENV APP_DIR=$HOME/app
WORKDIR APP_DIR

ONBUILD COPY package.json yarn.lock $APP_DIR
ONBUILD RUN chown -R node:node $APP_DIR

ONBUILD USER node
ONBUILD RUN yarn config set registry https://registry.yarnpkg.com \
  && yarn config set no-progress true \
  && yarn install --pure-lockfile \
  && yarn cache clean

ONBUILD USER root
ONBUILD RUN apk del git make gcc g++ python libx11-dev libxi-dev libxext-dev mesa-dev
ONBUILD COPY . $HOME/agjs
ONBUILD RUN chown -R node:node $HOME/agjs
ONBUILD USER node

ENV NODE_ENV=production

# FROM rp_node:6.10.2-alpine

# ARG VERSION
# ARG COMMIT
# ARG BUILD_NUMBER

# RUN yarn run build \
#   && script/buildinfo

# VOLUME $APP_DIR
# CMD ["yarn", "start"]
