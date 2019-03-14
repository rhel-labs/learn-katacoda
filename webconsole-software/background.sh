#!/bin/bash

usermod -aG wheel rhel

echo redhat | passwd --stdin rhel

yum -y install cockpit cockpit-packagekit

systemctl start cockpit
