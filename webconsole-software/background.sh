#!/bin/bash

yum -y install cockpit cockpit-packagekit

systemctl start cockpit

usermod -aG wheel rhel

echo redhat | passwd --stdin rhel
