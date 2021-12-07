FROM alpine:3.14

RUN apk add --no-cache curl bash

ARG MENDER_ARTIFACT_VERSION=3.6.1
RUN echo "https://downloads.mender.io/mender-artifact/${MENDER_ARTIFACT_VERSION}/linux/mender-artifact"
RUN curl https://downloads.mender.io/mender-artifact/${MENDER_ARTIFACT_VERSION}/linux/mender-artifact --output /bin/mender-artifact
RUN chmod a+x /bin/mender-artifact

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]