
FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add --no-cache curl bash openssl1.1-compat

RUN curl https://downloads.mender.io/mender-artifact/3.10.0/linux/mender-artifact --output /bin/mender-artifact
RUN chmod +x /bin/mender-artifact

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
