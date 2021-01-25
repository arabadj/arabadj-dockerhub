#!/bin/bash

docker build . -f CentOS7.Dockerfile -t arabadj/centos-debug:7-latest
docker build . -f CentOS8.Dockerfile -t arabadj/centos-debug:8-latest



docker run -it --rm --name centos-debug arabadj/centos-debug:7-latest /bin/bash
docker run -it --rm --name centos-debug arabadj/centos-debug:8-latest /bin/bash

docker run -it --rm --name centos-debug --privileged --net=host arabadj/centos-debug:8.2-latest /bin/bash


