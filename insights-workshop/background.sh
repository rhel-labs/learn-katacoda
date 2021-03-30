#!/bin/bash

sed -ei 's/ClientAliveInterval.*900//g' /etc/ssh/sshd_config


