!#/bin/bash

echo "adding ansible repo" > /root/post-run.log
subscription-manager repos --enable=ansible-2.9-for-rhel-8-x86_64-rpms &>> /root/post-run.log

echo "installing ansible" >> /root/post-run.log
yum -y install ansible &>> /root/post-run.log

#echo "Upgrade machines to latest version of RHEL" >> /root/post-run.log
ansible-playbook playbook-upgrade.yml &>> /root/post-run.log

#Create a done file to signal we have finished
touch /root/post-run.log.done
