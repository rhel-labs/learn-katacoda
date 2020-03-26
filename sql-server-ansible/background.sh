!#/bin/bash

touch /root/post-run.log

wget https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/sql-server-ansible/site.yml &>> /root/post-run.log
wget https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/sql-server-ansible/ansible.cfg &>> /root/post-run.log
wget https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/sql-server-ansible/InstPubs.sql &>> /root/post-run.log

echo "adding ansible repo" >> /root/post-run.log
subscription-manager repos --enable=ansible-2.9-for-rhel-8-x86_64-rpms &>> /root/post-run.log

echo "Setting hostname env" >> /root/post-run.log
export HOSTNAME=`hostname --all-fqdns` &>> /root/post-run.log

echo "Setting hostname as localhost in site.yml"
sed -i -e "s/host1/localhost/g" site.yml &>> /root/post-run.log
#sed -i -e "s/host1/$HOSTNAME/g" site.yml &>> /root/post-run.log

echo "installing ansible and pip3" >> /root/post-run.log
yum -y install ansible python3 &>> /root/post-run.log

#Create a done file to signal we have finished
touch /root/post-run.log.done
