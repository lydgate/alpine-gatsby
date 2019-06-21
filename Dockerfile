FROM mhart/alpine-node:12

ENV user gatsby

RUN apk update && apk upgrade && apk add --no-cache git
RUN npm install -g gatsby-cli
#RUN npm install -g surge

# If you have native dependencies, you may need extra tools
# RUN apk add --no-cache make gcc g++ python

RUN adduser -D -h /home/${user} ${user} \
 && chown -R ${user} /home/${user}

USER ${user}

WORKDIR /sites
