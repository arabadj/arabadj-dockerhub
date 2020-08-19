#!/bin/bash

docker build . -t arabadj/centos-debug:8

docker run -it --rm --name centos-debug arabadj/centos-debug:8 /bin/bash


