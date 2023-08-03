ARG TAG_NODE=lts-bullseye
ARG APP_PATH=/opt/explorer


FROM node:$TAG_NODE

LABEL org.opencontainers.image.source=https://github.com/torus-economy/explorer
LABEL org.opencontainers.image.description="Torus block explorer"
LABEL maintainer="Sven Skender (@sskender)"

ARG APP_PATH
ENV APP_PATH=$APP_PATH

WORKDIR $APP_PATH

COPY . .

ENV NODE_ENV=production

RUN npm install --production

RUN rm tmp/delete.me
RUN chown -R node:node tmp \
    && chmod -R 750 tmp \
    && chmod +x tmp

USER node

EXPOSE 3000

CMD ["npm", "start"]
