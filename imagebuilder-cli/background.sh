#!/bin/bash

#Create an output file
touch /root/post-run.log

#Download the SQL Query script
wget https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/imagebuilder-cli/node-app-server.toml

#Create a done file to signal we have finished
touch /root/post-run.log.done
