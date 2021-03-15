#!/bin/bash

#Create an output file
touch /root/post-run.log

#Download the SQL Query script
wget https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/pcp-intro/createUser.sql

#Download the install script and run it
curl -o /root/install_sql.sh https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/sql-server-crypto-policy/install_sql2019.sh
sudo chmod +x ./install_sql.sh

sudo ./install_sql.sh &>> /root/post-run.log
export HOSTNAME=`hostname --all-fqdns`

firewall-cmd --zone=public --add-service=https --permanent
firewall-cmd --reload

systemctl --now enable httpd

#Install python and unixODBC dependant packages
sudo yum install gcc-c++ python3-devel unixODBC-devel -y
sudo pip3 install pyodbc

#Create a done file to signal we have finished
touch /root/post-run.log.done
