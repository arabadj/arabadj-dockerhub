#!/bin/bash

docker build . -f CentOS7.Dockerfile -t arabadj/centos-httpd:7
docker build . -f CentOS8.Dockerfile -t arabadj/centos-httpd:8

docker run -d --name centos-httpd arabadj/centos-httpd:8
docker run -d --name centos-httpd -p 80:80/tcp arabadj/centos-httpd:8
docker run -d --name centos-httpd -p 127.0.0.1:80:80/tcp arabadj/centos-httpd:8
docker run -d --name centos-httpd -p 192.168.73.31:80:80/tcp arabadj/centos-httpd:8

docker exec -it centos-httpd /bin/bash

