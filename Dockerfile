FROM node:18.16.0-alpine as builder
WORKDIR /app

ADD . ./

RUN yarn install
RUN yarn build

FROM node:18.16.0-alpine
WORKDIR /app

ENV HOST=0.0.0.0

ADD package.json ./
ADD nuxt.config.js ./

COPY --from=builder ./app/node_modules ./node_modules/
COPY --from=builder ./app/.nuxt ./.nuxt/

EXPOSE 3000
