FROM centos:8
      
RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install net-tools && \
    yum -y --setopt=tsflags=nodocs install bind-utils && \
    yum -y --setopt=tsflags=nodocs install traceroute && \
    yum -y --setopt=tsflags=nodocs install telnet && \
    yum -y --setopt=tsflags=nodocs install psmisc && \
    yum -y --setopt=tsflags=nodocs install nmap && \
    yum -y --setopt=tsflags=nodocs install mtr && \
    yum -y --setopt=tsflags=nodocs install tree && \
    yum -y --setopt=tsflags=nodocs install wget && \
    yum -y --setopt=tsflags=nodocs install tcpdump && \
    yum clean all


