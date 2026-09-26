FROM node:22-alpine
RUN apk add --no-cache curl tar
WORKDIR /app
ARG PASCAL_VERSION=1.0.3
RUN curl -fL "https://github.com/pascalorg/editor/releases/download/@pascal-app/cli@${PASCAL_VERSION}/pascal-web-runtime-${PASCAL_VERSION}.tar.gz" -o /tmp/runtime.tar.gz \
 && tar -xzf /tmp/runtime.tar.gz -C /app \
 && rm /tmp/runtime.tar.gz
ENV PASCAL_DATA_DIR=/data
ENV PORT=3000
ENV HOSTNAME=0.0.0.0
ENV NODE_ENV=production
EXPOSE 3000
VOLUME /data
CMD ["node", "apps/editor/server.js"]
