# -*- Dockerfile -*-

FROM chadxz/asterisk:13
MAINTAINER David M. Lee, II <dlee@respoke.io>

ENV CHAN_RESPOKE_VERSION=v1.0.0
RUN mkdir -p /usr/src/chan_respoke && \
    cd /usr/src/chan_respoke && \
    curl -sL https://github.com/respoke/chan_respoke/archive/${CHAN_RESPOKE_VERSION}.tar.gz | \
         tar --strip-components 1 -xz && \
    make all install && \
    install -m 644 example/sounds/respoke* /var/lib/asterisk/sounds/ && \
    sed 's#^;dtls_cert_file=.*$#dtls_cert_file=/usr/etc/asterisk/keys/respoke.pem#' respoke.conf.sample > /usr/etc/asterisk/respoke.conf && \
    rm -rf /usr/src/chan_respoke

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/asterisk", "-f"]