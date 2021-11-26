#!/bin/bash

yum -y install httpd

firewall-cmd --permanent --zone=public --add-service=http
systemctl reload firewalld

systemctl enable --now httpd
