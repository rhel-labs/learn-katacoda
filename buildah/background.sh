#!/bin/bash

yum -y install buildah podman
yum update -y runc
buildah rm -a
setsebool -P container_manage_cgroup true

systemctl stop httpd
systemctl disable httpd

podman image rm rhel8-httpd
