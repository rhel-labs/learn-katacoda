#!/bin/bash

echo "done" >> /root/katacoda-finished

yum -y install cockpit cockpit-packagekit

systemctl start cockpit

usermod -aG wheel rhel

echo redhat | passwd --stdin rhel

echo "done" >> /root/katacoda-background-finished
