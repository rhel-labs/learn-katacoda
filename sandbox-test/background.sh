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
sudo rpm --import https://repo.logdna.com/logdna.gpg
echo "[logdna]
name=LogDNA packages
baseurl=https://repo.logdna.com/el6/
enabled=1
gpgcheck=1
gpgkey=https://repo.logdna.com/logdna.gpg" | sudo tee /etc/yum.repos.d/logdna.repo
sudo yum -y install logdna-agent
sudo logdna-agent -k b1f7f85d2b222d70427c214a4faedc67 # this is your unique Ingestion 
# /var/log is monitored/added by default (recursively), optionally add more dirs with:
sudo logdna-agent -d /path/to/log/folders
# You can configure the LogDNA Agent to tag your hosts with:
# sudo logdna-agent -t mytag,myothertag
sudo chkconfig logdna-agent on
sudo service logdna-agent start


echo "DONE" >> /root/post-run.log
