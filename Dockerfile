
FROM ubuntu

RUN apt-get update && apt-get -y install curl bash

RUN curl https://downloads.mender.io/mender-artifact/3.6.1/linux/mender-artifact --output /bin/mender-artifact
RUN chmod +x /bin/mender-artifact

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]