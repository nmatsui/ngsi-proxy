FROM node:10.15-alpine

MAINTAINER Nobuyuki Matsui <nobuyuki.matsui@gmail.com>

COPY . /opt/ngsi-proxy
WORKDIR /opt/ngsi-proxy

RUN apk update && apk add --no-cache tini && npm install --production

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/local/bin/node", "/opt/ngsi-proxy/app.js"]
