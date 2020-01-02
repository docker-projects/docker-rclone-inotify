FROM alpine:3.11

ENV S6_VER 1.22.1.0
ENV RCLONE_VER 1.50.2

ENV USER abc
ENV GROUP abc
ENV GID 911
ENV UID 911

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS 2

RUN set -xe && \
    addgroup -S ${GROUP} -g ${GID} && adduser -D -S -u ${UID} ${USER} ${GROUP} && \
    apk add -U entr inotify-tools tzdata curl unzip && \
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/v${S6_VER}/s6-overlay-amd64.tar.gz -o /tmp/s6-overlay-amd64.tar.gz && \
    tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    curl -sSL https://github.com/rclone/rclone/releases/download/v${RCLONE_VER}/rclone-v${RCLONE_VER}-linux-amd64.zip -o /tmp/rclone-linux-amd64.zip && \
    unzip -j /tmp/rclone-linux-amd64.zip -d /tmp/rclone && \
    cp /tmp/rclone/rclone /usr/bin/ && \
    apk del curl unzip && \
    rm -rf /tmp/*

COPY root/ /

ENTRYPOINT [ "/init" ]
