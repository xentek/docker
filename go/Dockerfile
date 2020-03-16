FROM xentek/base:3.11
LABEL maintainer="eric.marden@gmail.com"

ENV GOPATH /opt/go
ENV PATH "${PATH}:${GOPATH}/bin"

RUN mkdir -p /opt/go/bin /opt/go/src \
      && chmod 777 /opt/go/bin

RUN /opt/bin/install-go.sh

WORKDIR $GOPATH
CMD ["sh"]
