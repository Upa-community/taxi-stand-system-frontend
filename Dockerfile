FROM node:18.16.0 as builder
WORKDIR /web

ADD . ./

RUN yarn install

FROM node:18.16.0
WORKDIR /web

ENV HOST=0.0.0.0

ADD package.json ./
ADD nuxt.config.js ./

COPY --from=builder ./web/node_modules ./node_modules/

EXPOSE 3000
