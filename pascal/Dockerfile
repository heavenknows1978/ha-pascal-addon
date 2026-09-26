FROM node:22-alpine
RUN apk add --no-cache curl tar stunnel openssl
WORKDIR /app
ARG PASCAL_VERSION=1.0.3
RUN curl -fL "https://github.com/pascalorg/editor/releases/download/@pascal-app/cli@${PASCAL_VERSION}/pascal-web-runtime-${PASCAL_VERSION}.tar.gz" -o /tmp/runtime.tar.gz \
 && tar -xzf /tmp/runtime.tar.gz -C /app \
 && rm /tmp/runtime.tar.gz
COPY run.sh /run.sh
RUN chmod +x /run.sh
ENV PASCAL_DATA_DIR=/data
ENV PORT=3000
ENV HOSTNAME=0.0.0.0
ENV NODE_ENV=production
EXPOSE 3443
VOLUME /data
CMD ["/run.sh"]
