!#/bin/bash

touch /root/post-run.log

wget https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/sql-server-ubi/InstPubs.sql &>> /root/post-run.log

#Create a done file to signal we have finished
touch /root/post-run.log.done

#Set selinux to permissive mode
setenforce 0
