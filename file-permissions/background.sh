#!/bin/bash

# create guest user account
useradd guest

# create team group and add guest
groupadd team
usermod -a -G team guest

# modify permissions on proprietary dir
chmod 640 /srv/proprietary
