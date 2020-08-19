FROM centos:7
      
RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all

EXPOSE 80

ADD start.sh /start.sh
RUN chmod -v +x /start.sh

CMD ["/start.sh"]
