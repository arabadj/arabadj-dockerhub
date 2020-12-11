#!/bin/bash

docker build . -f CentOS7.Dockerfile -t arabadj/centos-httpd:7.8-latest
docker build . -f CentOS8.Dockerfile -t arabadj/centos-httpd:8.2-latest


docker run -d --name centos-httpd arabadj/centos-httpd:7.8-latest
docker run -d --name centos-httpd arabadj/centos-httpd:8.2-latest

docker run -d --name centos-httpd -p 80:80/tcp arabadj/centos-httpd:7.8-latest
docker run -d --name centos-httpd -p 80:80/tcp arabadj/centos-httpd:8.2-latest

docker exec -it centos-httpd /bin/bash
