#!/bin/sh

sysctl -w net.ipv4.ip_forward=1

iptables -t nat -S POSTROUTING | grep "10.99.10.0/24 -j MASQUERADE" | cut -d " " -f 2- | xargs -rL1 iptables -t nat -D
iptables -t nat -A POSTROUTING -s 10.99.10.0/24 ! -d 10.99.10.0/24 -j MASQUERADE

iptables -S FORWARD | grep "ppp+ -j ACCEPT" | cut -d " " -f 2- | xargs -rL1 iptables -D
iptables -A FORWARD -i ppp+ -j ACCEPT
iptables -A FORWARD -o ppp+ -j ACCEPT

exec "$@"
