FROM alpine:3.9.3

ARG PACKAGES="openssh-client bash"
RUN apk add --no-cache --update ${PACKAGES}

COPY rootfs/ /

ENTRYPOINT [ "/entrypoint.sh" ]
