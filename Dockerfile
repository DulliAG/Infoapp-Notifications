FROM node:alpine

LABEL org.opencontainers.image.source https://github.com/DulliAG/Infoapp-Notifications

WORKDIR /usr/src/infoapp-notifications/

COPY package*.json ./

RUN --mount=type=secret,id=npm,target=.npmrc npm install

COPY . .

RUN npm run build

CMD ["node", "out/index.js"]