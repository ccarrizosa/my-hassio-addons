ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Setup base
RUN apk add --no-cache jq openssl

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

