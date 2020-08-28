FROM ubuntu:20.04


ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y net-tools iptables pptpd


COPY files/etc/pptpd.conf /etc/pptpd.conf
COPY files/etc/ppp/pptpd.options /etc/ppp/pptpd.options
COPY files/etc/ppp/ip-up.local /etc/ppp/ip-up.local
RUN chmod 0755 /etc/ppp/ip-up.local


COPY files/entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh
COPY files/starter.sh /starter.sh
RUN chmod 0700 /starter.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD /usr/bin/sh ./starter.sh
