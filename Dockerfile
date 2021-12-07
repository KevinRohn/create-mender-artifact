

FROM alpine:3.14

RUN apk add --no-cache curl bash

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]