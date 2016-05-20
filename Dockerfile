FROM mhart/alpine-node:6

MAINTAINER team@lastbackend.com

ADD . /opt

EXPOSE 5000

# If you have native dependencies, you'll need extra tools
RUN apk add --no-cache make gcc g++ python

RUN rm -rf /opt/node_modules
RUN cd /opt && npm install

# Setup main workdir
WORKDIR /opt
VOLUME /opt

# Default command
CMD node src/main.js