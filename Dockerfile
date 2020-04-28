FROM ubuntu:18.04

RUN apt-get update && \
  apk-get install -y ca-certificates && \
  rm -rf /var/lib/apt/lists/*

ADD https://github.com/counteractive/o365beat/releases/download/v1.5.1/o365beat-1.5.1-amd64.deb /tmp

RUN dpkg -i /tmp/o365beat-1.5.1-amd64.deb

COPY o365beat.yml /etc/o365beat/

CMD ["/bin/bash", "-c", "/usr/share/o365beat/bin/o365beat", "--e", "--c=o365beat.yml",  "--path.home=/usr/share/o365beat", "--path.config=/etc/o365beat", "--path.data=/var/lib/o365beat", "--path.logs=/var/log/o365beat"]
