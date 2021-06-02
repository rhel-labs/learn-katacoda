#!/bin/bash

# create guest user account
useradd guest

# create team group
groupadd team

# modify permissions on proprietary dir
chmod 640 /srv/proprietary
