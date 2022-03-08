# base image
FROM node:16-alpine 

# Create app directory
WORKDIR /app


COPY ./client/package.json ./client/package.json
RUN cd ./client && npm i 
COPY ./client ./client
RUN cd ./client && npm run build
RUN cp -R ./client/build ./public

COPY ./server .

RUN npm i

RUN npm ci --only=production

EXPOSE 80
CMD [ "node", "index.js" ] 