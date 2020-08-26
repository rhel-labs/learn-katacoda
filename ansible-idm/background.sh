!#/bin/bash

echo "adding ansible repo" > /root/post-run.log
subscription-manager repos --enable=ansible-2.8-for-rhel-8-x86_64-rpms &>> /root/post-run.log

echo "installing ansible" >> /root/post-run.log
yum -y install ansible &>> /root/post-run.log

echo "Replace placehold hostnames in ansible config file" >> /root/post-run.log
IP_HOST2=$(grep -Ri "host02" /etc/hosts | cut -d" " -f1)
IP_HOST3=$(grep -Ri "host03" /etc/hosts | cut -d" " -f1)

sed -i -e 's/%place02%/$IP_HOST2/g' /root/hosts >> /root/post-run.log
sed -i -e 's/%place03%/$IP_HOST3/g' /root/hosts >> /root/post-run.log

echo "Upgrade machines to latest version of RHEL" >> /root/post-run.log
ansible-playbook playbook-upgrade.yml &>> /root/post-run.log

#Create a done file to signal we have finished
touch /root/post-run.log.done
