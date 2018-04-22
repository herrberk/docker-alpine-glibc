FROM alpine:latest

ENV GLIBC_VERSION 2.27-r0

RUN apk --no-cache add ca-certificates wget && \
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
apk --allow-untrusted add glibc-${GLIBC_VERSION}.apk && \
rm -f glibc-${GLIBC_VERSION}.apk && \
rm -rf /var/cache/apk/ && \
apk version glibc

CMD ["echo", "Alpine Linux + glibc base image."]