#!/bin/bash

echo "Adding wheel" > /root/post-run.log
usermod -aG wheel rhel

echo "setting password" >> /root/post-run.log
echo redhat | passwd --stdin rhel

echo "adding cockpit" >> /root/post-run.log
yum -y install cockpit cockpit-packagekit

echo "starting cockpit" >> /root/post-run.log
systemctl start cockpit

echo "exclude=kernel*" >> /etc/yum.conf

echo "upgrading to RHEL 8.4" >> /root/post-run.log
sudo yum update -y

echo "DONE" >> /root/post-run.log
