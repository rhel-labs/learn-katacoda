!#/bin/bash

touch /root/post-run.log

wget https://github.com/rhel-labs/learn-katacoda/blob/master/sql-server-ansible/site.yml &>> /root/post-run.log
wget https://github.com/rhel-labs/learn-katacoda/blob/master/sql-server-ansible/ansible.cfg &>> /root/post-run.log

echo "adding ansible repo" >> /root/post-run.log
subscription-manager repos --enable=ansible-2.9-for-rhel-8-x86_64-rpms &>> /root/post-run.log

echo "installing ansible" >> /root/post-run.log
yum -y install ansible &>> /root/post-run.log

echo "Setting hostname env" >> /root/post-run.log
export HOSTNAME=`hostname --all-fqdns` &>> /root/post-run.log


