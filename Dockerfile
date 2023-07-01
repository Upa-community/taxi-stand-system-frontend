FROM node:18.16.0 as builder
WORKDIR /app

ADD . ./

RUN yarn install

FROM node:18.16.0
WORKDIR /app

ENV HOST=0.0.0.0

ADD package.json ./
ADD nuxt.config.js ./

COPY --from=builder ./app/node_modules ./node_modules/
COPY --from=builder ./app/.nuxt ./.nuxt/

EXPOSE 3000
