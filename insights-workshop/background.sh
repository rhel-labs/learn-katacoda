#!/bin/bash

sed -ie 's/ClientAliveInterval.*900//g' /etc/ssh/sshd_config


