

FROM alpine:3.14

ENV MENDER-ARTIFACT-VERSION=3.6.1

RUN apk add --no-cache curl bash

RUN curl https://downloads.mender.io/mender-artifact/${MENDER-ARTIFACT-VERSION}/linux/mender-artifact --output /bin/mender-artifact
RUN chmod a+x /bin/mender-artifact

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]