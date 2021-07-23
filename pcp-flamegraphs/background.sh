#!/bin/bash

#Create an output file
touch /root/post-run.log

export HOSTNAME=`hostname --all-fqdns`

firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --reload

systemctl --now enable httpd

#Get the sample database file
wget https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/pcp-flamegraphs/sample-testdata.sql

#Create a done file to signal we have finished
touch /root/post-run.log.done
