# Исходный Dockerfile
FROM ghcr.io/puppeteer/puppeteer:19.7.2

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

# Создаем non-root пользователя с известными UID и GID
RUN groupadd -g 1001 node && useradd -r -u 1001 -g node node

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci

COPY . .

USER node

CMD [ "node", "index.js" ]
