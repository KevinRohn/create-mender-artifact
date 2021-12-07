
FROM alpine:3.14

ARG MENDER_ARTIFACT_VERSION=3.6.1

RUN apk add --no-cache curl bash

ENV MENDER_ARTIFACT_VERSION=${MENDER_ARTIFACT_VERSION}

RUN curl https://downloads.mender.io/mender-artifact/${MENDER_ARTIFACT_VERSION}/linux/mender-artifact --output /opt/mender-artifact
RUN chmod a+x /opt/mender-artifact

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]