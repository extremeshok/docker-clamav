FROM extremeshok/baseimage-alpine:latest AS BUILD

LABEL mantainer="Adrian Kriel <admin@extremeshok.com>" vendor="eXtremeSHOK.com"

RUN \
  echo "**** install clamav ****" \
  && apk-install clamav clamav-libunrar

RUN \
  echo "**** install bash runtime packages ****" \
  && apk-install \
    bash \
    coreutils \
    curl \
    openssl \
    rsync \
    tzdata

# add local files
COPY ./rootfs/ /

EXPOSE 3310/tcp

WORKDIR /tmp

ENTRYPOINT ["/init"]
