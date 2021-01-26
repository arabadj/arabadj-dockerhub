#!/bin/sh



docker build . -f build-green.Dockerfile -t arabadj/ubuntu-pptpd:green
docker build . -f build-blue.Dockerfile -t arabadj/ubuntu-pptpd:blue
docker build . -f build-red.Dockerfile -t arabadj/ubuntu-pptpd:red

docker image tag arabadj/ubuntu-pptpd:blue arabadj/ubuntu-pptpd:20.04-VERSION


docker run -d --restart always --name=ubuntu-pptpd --privileged --net=host \
    -v ~/.local/opt/vpnp/etc/ppp/chap-secrets:/etc/ppp/chap-secrets:ro arabadj/ubuntu-pptpd:20.04-1.0.2

docker exec -it vpnp_svc_1 /bin/bash





 