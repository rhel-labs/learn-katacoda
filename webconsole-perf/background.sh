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

echo "Install PCP packages" >> /root/post-run.log
sudo yum install pcp-zeroconf -y
sudo yum install cockpit-pcp -y

echo "restart cockpit" >> /root/post-run.log
systemctl restart cockpit

echo "Install Stress-NG" >> /root/post-run.log
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo yum install -y stress-ng

echo "DONE" >> /root/post-run.log

touch /root/post-run.log.done
