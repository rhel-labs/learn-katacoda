#!/bin/bash

#Create an output file
touch /root/post-run.log

export HOSTNAME=`hostname --all-fqdns`

firewall-cmd --zone=public --add-service=https --permanent
firewall-cmd --reload

systemctl --now enable httpd

#Get the sample database file
wget https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/pcp-flamegraphs/sample.sql

#Create a done file to signal we have finished
touch /root/post-run.log.done
