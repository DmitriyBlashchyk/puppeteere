# Исходный Dockerfile
FROM ghcr.io/puppeteer/puppeteer:19.7.2

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

WORKDIR /home/node/app

COPY package*.json ./

RUN npm install
COPY . .


ENV GIT_WORK_TREE=/home/node/app GIT_DIR=/home/node/.git

RUN apt-get update && \
    apt-get install git
