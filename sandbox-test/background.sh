#!/bin/bash

echo "Adding wheel" > /root/post-run.log
usermod -aG wheel rhel

echo "setting password" >> /root/post-run.log
echo redhat | passwd --stdin rhel

echo "adding cockpit" >> /root/post-run.log
yum -y install cockpit cockpit-packagekit

echo "starting cockpit" >> /root/post-run.log
systemctl start cockpit

echo "setting up elastic logging" >> /root/post-run.log
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.14.2-x86_64.rpm
sudo rpm -vi filebeat-7.14.2-x86_64.rpm


echo "DONE" >> /root/post-run.log
