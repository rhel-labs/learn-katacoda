#!/bin/bash

sed -ei 's/\# Per.*//g' /etc/ssh/sshd_config
sed -ei 's/ClientAliveInterval.*900//g' /etc/ssh/sshd_config


