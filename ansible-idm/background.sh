!#/bin/bash

#echo "Cleanup rhsm on control node" >> /root/post-run.log
#sudo subscription-manager remove --all 
#sudo subscription-manager unregister
#sudo subscription-manager clean

#echo "Setup activation key" >> /root/post-run.log
#subscription-manager register --org='12451665' --activationkey='idm-lab-temp' --force
#sudo subscription-manager refresh
#sudo subscription-manager attach --auto

echo "adding ansible repo" >> /root/post-run.log
subscription-manager repos --enable=ansible-2.8-for-rhel-8-x86_64-rpms &>> /root/post-run.log

echo "installing ansible" >> /root/post-run.log
yum -y install ansible &>> /root/post-run.log

echo "Replace placehold hostnames in ansible config file" >> /root/post-run.log
IP_HOST1=$(hostname -i | awk '{print $NF}')
IP_HOST2=$(grep -Ri "host02" /etc/hosts | cut -d" " -f1)
IP_HOST3=$(grep -Ri "host03" /etc/hosts | cut -d" " -f1)

sed -i 's/%place01%/'"$IP_HOST1"'/' /root/hosts &>> /root/post-run.log
sed -i 's/%place02%/'"$IP_HOST2"'/' /root/hosts &>> /root/post-run.log
sed -i 's/%place03%/'"$IP_HOST3"'/' /root/hosts &>> /root/post-run.log

#echo "Register hosts02/03" >> /root/post-run.log
#ansible-playbook playbook-register.yml &>> /root/post-run.log

#echo "Upgrade machines to latest version of RHEL" >> /root/post-run.log
#ansible-playbook playbook-upgrade.yml &>> /root/post-run.log

#Create a done file to signal we have finished
touch /root/post-run.log.done
