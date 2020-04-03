FROM ubuntu:18.04

ADD https://github.com/counteractive/o365beat/releases/download/v1.5.1/o365beat-1.5.1-amd64.deb

RUN dpkg -i o365beat-1.5.1-amd64.deb \
    rm o365beat-1.5.1-amd64.deb

COPY o365beat.yml /etc/o365beat/

CMD ["/usr/share/o365beat/bin/o365beat -e -c /etc/o365beat/o365beat.yml -path.home /usr/share/o365beat -path.config /etc/o365beat -path.data /var/lib/o365beat -path.logs /var/log/o365beat"]
