ARG ARCH=
FROM ${ARCH}alpine:3.7

RUN apk add --no-cache htop && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing shellinabox
RUN mkdir /data && chmod 0777 /data
VOLUME /data

COPY solarized.css /
RUN chmod 0644 /solarized.css
COPY htop.sh  /
RUN chmod 0755 /htop.sh

EXPOSE 4200
ENTRYPOINT [ \
    "/usr/bin/shellinaboxd", \
    "--service=/:nobody:nobody:/:/htop.sh", \
    "--disable-ssl" \
]
CMD [ \
    "--no-beep", \
    "--css=/solarized.css" \
]
