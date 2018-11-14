FROM alpine:3.5

RUN apk add --update --no-cache \
    ca-certificates \
    bash \
    python \
    && python -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip install --upgrade --ignore-installed \
    pip \
    setuptools \
    awscli \
    && rm -r /root/.cache

COPY sync.sh /bin/

EXPOSE 80

ENTRYPOINT ["/bin/bash" , "-c"]