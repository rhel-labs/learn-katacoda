!#/bin/bash

echo "installing ansible" >> /root/post-run.log
yum -y install ansible &>> /root/post-run.log
