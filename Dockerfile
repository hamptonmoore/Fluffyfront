FROM node:14-alpine AS builder

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run-script build

FROM socialengine/nginx-spa
COPY --from=builder /usr/src/app/public/ /app