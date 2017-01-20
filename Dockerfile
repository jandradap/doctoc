FROM node:7.4.0-alpine

MAINTAINER Jorge Andrada Prieto <jandradap@gmail.com>

RUN npm install -g doctoc && \
	mkdir /usr/src

WORKDIR /usr/src

ENTRYPOINT ["doctoc", ".", "--notitle"]
