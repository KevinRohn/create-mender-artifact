
FROM alpine:3.14

RUN apk add --no-cache curl bash

#RUN curl https://downloads.mender.io/mender-artifact/3.6.1/linux/mender-artifact --output /bin/mender-artifact
#RUN chmod a+x /bin/mender-artifact

COPY mender-artifact /mender-artifact
RUN chmod +x mender-artifact

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]