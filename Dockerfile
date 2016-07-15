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

# Install nodejs 4.x
RUN curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
RUN yum isntall nodejs -y 

# Add taobao mirrors for NPM
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
# Let Docker handle the daemon
# RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Attach volumes.
# VOLUME /etc/nginx/sites-enabled
VOLUME /var/log/nginx
#Document Root
VOLUME /usr/share/nginx/html

# Set working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80
EXPOSE 443

# Define default command.
# ENTRYPOINT ["nginx"]
CMD ["nginx", "-g", "daemon off;"]
