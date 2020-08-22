#!/bin/sh

mkdir -p ~/.local/etc/ppp
aws ssm get-parameters --region eu-central-1 --name arabadj_pptpd_password --query Parameters[*].{Value:Value} --output text > ~/.local/etc/ppp/chap-secrets
chmod 600 ~/.local/etc/ppp/chap-secrets

docker build . -t arabadj/ubuntu-pptpd:20

docker stop ubuntu-pptpd &> /dev/null; docker rm ubuntu-pptpd &> /dev/null
docker run -d --name=ubuntu-pptpd --privileged --net=host -v ~/.local/etc/ppp/chap-secrets:/etc/ppp/chap-secrets arabadj/ubuntu-pptpd:20

docker stop ubuntu-pptpd &> /dev/null; docker rm ubuntu-pptpd &> /dev/null
docker run -d --restart always --name=ubuntu-pptpd --privileged --net=host -v ~/.local/etc/ppp/chap-secrets:/etc/ppp/chap-secrets arabadj/ubuntu-pptpd:20

docker exec -it ubuntu-pptpd /bin/bash

docker push arabadj/ubuntu-pptpd:20
