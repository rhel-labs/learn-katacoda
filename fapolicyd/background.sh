#!/bin/bash
echo "Adding wheel" > /root/post-run.log
usermod -aG wheel rhel

echo "Setting password" >> /root/post-run.log
echo redhat | passwd --stdin rhel

echo "Adding cowsay" >> /root/post-run.log
curl -L https://github.com/Code-Hex/Neo-cowsay/releases/download/v2.0.4/cowsay_2.0.4_Linux_x86_64.tar.gz | tar xvz -C /home/rhel

echo "Fixing permissions" >> /root/post-run.log
chown rhel:rhel /home/rhel/*
