FROM node:14.9.0-alpine3.10

# Create app directory
WORKDIR /usr/src/app
RUN apk update && apk add git
RUN git clone https://github.com/vasanthv/talk.git .
RUN sed -i '/hello.js/d' ./www/index.html
RUN sed -i '/skip analytics/d' ./www/script.js
RUN sed -i '/usetalk.io/d' ./www/script.js
RUN sed -i 's/usetalk.io/talk.unmute.tv/g' ./www/index.html
RUN echo $(ls -1 /usr/src/app)
RUN npm install

EXPOSE 3000
CMD [ "node", "server.js" ]
