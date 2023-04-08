FROM node:16-alpine as BASE
LABEL author="quangnx"

WORKDIR /app
COPY package.json package-lock.json ./
RUN apk add --no-cache git \
    && npm ci

# Build Image
FROM node:16-alpine AS BUILD
LABEL author="quangnx"

RUN apk add --no-cache curl \
  && curl -sf https://gobinaries.com/tj/node-prune | sh -s -- -b /usr/local/bin \
  && apk del curl
# optimize image

WORKDIR /app
COPY --from=BASE /app/node_modules ./node_modules
COPY . .
RUN apk add --no-cache git curl \
    && npm run generate \
    && node-prune

# Build production
FROM node:16-alpine AS PRODUCTION
LABEL author="quangnx"


WORKDIR /app

RUN npm install "nuxt-start@2.15.8"

COPY --from=BUILD /app/nuxt.config.js ./

COPY --from=BUILD /app/dist ./dist

COPY package.json package-lock.json ./

COPY entrypoint.sh .

COPY .env .


# Execute script
RUN apk add --no-cache --upgrade bash
RUN ["chmod", "+x", "./entrypoint.sh"]
ENTRYPOINT ["./entrypoint.sh"]
ENV HOST 0.0.0.0
EXPOSE 8080

ENTRYPOINT ["npx", "nuxt-start"]
EXPOSE 8080