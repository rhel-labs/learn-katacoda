#!/bin/bash

echo "Adding wheel" > /root/post-run.log
usermod -aG wheel rhel

echo "setting password" >> /root/post-run.log
echo redhat | passwd --stdin rhel

echo "adding cockpit" >> /root/post-run.log
yum -y install cockpit cockpit-packagekit

echo "starting cockpit" >> /root/post-run.log
systemctl start cockpit

echo "setting up logging" >> /root/post-run.log
firewall-cmd --permanent --add-port=514/udp
firewall-cmd --permanent --add-port=514/tcp
firewall-cmd --reload
curl -O https://www.loggly.com/install/configure-linux.sh
sudo bash configure-linux.sh -a rhtestdemo -t 1e39fb71-0ac5-44dd-b559-acb4230a542a -u don

echo "DONE" >> /root/post-run.log
