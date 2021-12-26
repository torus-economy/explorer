ARG TAG_NODE=lts-bullseye
ARG APP_PATH=/opt/explorer

FROM node:$TAG_NODE

ARG APP_PATH
ENV APP_PATH=$APP_PATH

WORKDIR $APP_PATH
RUN chown node:node $APP_PATH

USER node

COPY --chown=node:node . .
RUN npm install --production

CMD ["npm", "start"]
