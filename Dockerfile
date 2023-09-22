# Исходный Dockerfile
FROM ghcr.io/puppeteer/puppeteer:19.7.2

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

# Создаем non-root пользователя node
RUN adduser --disabled-password --gecos "" node

WORKDIR /usr/src/app

# Устанавливаем директорию, в которой будут выполняться команды от пользователя node
RUN chown -R node:node .

# Переключаемся на пользователя node
USER node

COPY package*.json ./

RUN npm ci

# Переключаемся обратно на пользователя root для запуска приложения
USER root

COPY . .

CMD [ "node", "index.js" ]
