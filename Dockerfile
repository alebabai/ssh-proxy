FROM alpine:3.9.3

LABEL maintainer="aliaksandr.babai@gmail.com" 

ARG PACKAGES="openssh-client bash"
RUN apk add --no-cache --update ${PACKAGES}

COPY rootfs/ /

ENTRYPOINT [ "/entrypoint.sh" ]
