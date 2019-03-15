FROM node:8.10.0

RUN wget -P /tmp/ https://get.docker.com/builds/Linux/x86_64/docker-1.12.6.tgz && \
    tar -xvf /tmp/docker-1.12.6.tgz --directory /tmp/ && \
    mv /tmp/docker/docker /usr/local/bin

RUN mkdir -p /usr/src/garie-browsertime
RUN mkdir -p /usr/src/garie-browsertime/reports

WORKDIR /usr/src/garie-browsertime

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
