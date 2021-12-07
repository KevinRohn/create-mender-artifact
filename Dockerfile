

FROM alpine:3.10

ENV MENDER-ARTIFACT-VERSION=3.6.1

RUN curl https://downloads.mender.io/mender-artifact/${MENDER-ARTIFACT-VERSION}/linux/mender-artifact --output /bin/mender-artifact
RUN chmod a+x /bin/mender-artifact

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]