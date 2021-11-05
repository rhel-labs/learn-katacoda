#!/bin/bash

echo "Adding wheel" > /root/post-run.log
usermod -aG wheel rhel

echo "setting password" >> /root/post-run.log
echo redhat | passwd --stdin rhel

echo "adding cockpit" >> /root/post-run.log
yum -y install cockpit cockpit-packagekit

echo "starting cockpit" >> /root/post-run.log
systemctl start cockpit


echo "getting logging" >> /root/post-run.log
yum install -y tlog
sudo rpm --import https://repo.logdna.com/logdna.gpg
echo "[logdna]
name=LogDNA packages
baseurl=https://repo.logdna.com/el6/
enabled=1
gpgcheck=1
gpgkey=https://repo.logdna.com/logdna.gpg" | sudo tee /etc/yum.repos.d/logdna.repo

echo "setting up agents" >> /root/post-run.log
sudo yum -y install logdna-agent
sudo logdna-agent -k b1f7f85d2b222d70427c214a4faedc67 # this is your unique Ingestion 
sudo chkconfig logdna-agent on

echo "starting up logging" >> /root/post-run.log
sudo tlog-rec --writer=file --file-path=/var/log/tlog.log
sudo service logdna-agent start

#Create a done file to signal we have finished
touch /root/post-run.log.done
