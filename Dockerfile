FROM ubuntu:18.04

ADD https://github.com/counteractive/o365beat/releases/download/v1.5.1/o365beat-1.5.1-amd64.deb /tmp

RUN dpkg -i /tmp/o365beat-1.5.1-amd64.deb \
    && mkdir -p /var/lib/o365beat \
    && mkdir -p /var/log/o365beat \
    && useradd -ms /bin/bash o365beat \
    && chown o365beat:o365beat /var/log/o365beat \
    && chown o365beat:o365beat /var/lib/o365beat \
    && chown o365beat:o365beat /etc/o365beat/o365beat.yml
COPY o365beat.yml /etc/o365beat/
USER o365beat
RUN chmod 600 /etc/o365beat/o365beat.yml

CMD ["/usr/share/o365beat/bin/o365beat -e -c /etc/o365beat/o365beat.yml -path.home /usr/share/o365beat -path.config /etc/o365beat -path.data /var/lib/o365beat -path.logs /var/log/o365beat"]
