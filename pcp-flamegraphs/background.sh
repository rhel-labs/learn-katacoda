#!/bin/bash

#Create an output file
touch /root/post-run.log

export HOSTNAME=`hostname --all-fqdns`

systemctl restart firewalld

firewall-cmd --zone=public --add-service=http 
firewall-cmd --reload

systemctl restart httpd
systemctl --now enable httpd

#Get the sample database file
wget https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/pcp-flamegraphs/sample-testdata.sql

#Create a done file to signal we have finished
touch /root/post-run.log.done
