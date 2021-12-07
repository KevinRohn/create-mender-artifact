

FROM alpine:3.14

ENV MENDER-ARTIFACT-VERSION=3.6.1

RUN apk add --no-cache curl

RUN curl https://downloads.mender.io/mender-artifact/${MENDER-ARTIFACT-VERSION}/linux/mender-artifact --output /bin/mender-artifact
RUN chmod a+x /bin/mender-artifact
RUN chmod +x entrypoint.sh
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]