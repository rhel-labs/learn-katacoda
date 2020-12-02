#!/bin/bash

echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

ssh host02 'subscription-manager  repos --enable=ansible-2.9-for-rhel-8-x86_64-rpms'
ssh host03 'subscription-manager  repos --enable=ansible-2.9-for-rhel-8-x86_64-rpms'
