#!/bin/bash

firewall-cmd --zone=public --add-service=https --permanent
firewall-cmd --reload

systemctl --now enable httpd
