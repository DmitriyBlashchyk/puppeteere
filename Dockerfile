# Исходный Dockerfile
FROM ghcr.io/puppeteer/puppeteer:19.7.2

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

WORKDIR /usr/src/app

# Не создавайте пользователя и не меняйте владельца, используйте существующего пользователя node
COPY package*.json ./

RUN npm ci

COPY . .

USER node

CMD [ "node", "index.js" ]
