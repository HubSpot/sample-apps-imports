FROM node:10

WORKDIR /imports-contacts-sample-app/src
RUN apt-get update && apt-get install -y vim
COPY src/package.json ./
COPY src/package-lock.json ./
RUN npm install

EXPOSE 3000
