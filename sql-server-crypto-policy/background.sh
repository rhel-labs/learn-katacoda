#!/bin/bash

sudo chmod +x ./install_sql.sh
sudo ./install_sql.sh

firewall-cmd --zone=public --add-service=https --permanent
firewall-cmd --reload

systemctl --now enable httpd
