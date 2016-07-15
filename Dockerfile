#
# Nginx Dockerfile
# 
# https://github.com/nanderson94/dockerfile-nginx
# 
# Based on: https://github.com/dockerfile/nginx
#

# Pull base image.
# FROM centos
FROM registry.aliyuncs.com/acs-sample/centos:7

# Should something be wrong
MAINTAINER Nicholas Anderson, nander13@gmu.edu

# Add nginx official repository
ADD nginx.repo /etc/yum.repos.d/nginx.repo

# Install nginx and apply updates
RUN yum update -y
RUN yum install -y nginx

# Add default.conf for nginx
COPY nginx-default.conf /etc/nginx/conf.d/default.conf
COPY ningx-gzip.conf /etc/nginx/conf.d/gzip.conf

# Let Docker handle the daemon
# RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Attach volumes.
# VOLUME /etc/nginx/sites-enabled
VOLUME /var/log/nginx
# WWW directory 
VOLUME /var/wwww/

# Set working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80
EXPOSE 443

# Define default command.
# ENTRYPOINT ["nginx"]
CMD ["nginx", "-g", "daemon off;"]
