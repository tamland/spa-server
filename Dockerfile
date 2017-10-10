FROM node:alpine

EXPOSE 8080

ENV EXPOSE_VARS=""

RUN mkdir -p /var/www/html
RUN mkdir /app
COPY package.json /app
COPY server.js /app
WORKDIR /app
RUN npm install

CMD ["npm", "start"]

