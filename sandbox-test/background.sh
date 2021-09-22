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

echo "configure cred" >> /root/post-run.log
sed -i 's/#cloud.id:/cloud.id: "Sandbox-Logs:ZWFzdHVzMi5henVyZS5lbGFzdGljLWNsb3VkLmNvbSQxZGUwZjgxMDIyMWM0ZGIwYjVjOWZlZTQ2ZmE4OTQ5YiRhYjViM2FkOTY3NDY0NWM0OTY3OTVjZWNlOWNjM2VmYg=="/g' /etc/filebeat/filebeat.yml
sed -i 's/#cloud.auth:/cloud.auth: "elastic:eVFZKQqch39DRL8yUsNHueOQ"/g' /etc/filebeat/filebeat.yml
sed -i 's/localhost:9200/https://sandbox-logs.es.eastus2.azure.elastic-cloud.com:9243/g' /etc/filebeat/filebeat.yml

echo "DONE" >> /root/post-run.log
