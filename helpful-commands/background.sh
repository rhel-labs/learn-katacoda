#!/bin/bash

# create notes file and populate with some text

echo "Just thinking about everything I have been through, and how huge it all feels." >> quote.txt
echo "The fact that it is just a small part of something larger" >> quote.txt

# install locate
yum install -y mlocate

# update locate db
updatedb
