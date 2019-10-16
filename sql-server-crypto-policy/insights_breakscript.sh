#!/bin/bash -e

# Use the following variables to control your install:

# Password for the SA user (required)
MSSQL_SA_PASSWORD='Redhat1!'


if [ -z $MSSQL_SA_PASSWORD ]
then
  echo Environment variable MSSQL_SA_PASSWORD must be set for unattended install
  exit 1
fi

echo Reading command line parameter to break setup and trigger insights
if [ "$1" == "1" ] 
then
    echo Positional parameter 1 contains 1

elif [ "$1" == "2" ]
then
    echo Positional parameter 1 contains 2

elif [ "$1" == "3" ]
then
    echo Positional parameter 1 contains 3

fi

# Restart SQL Server after installing:
if [ "$1" != "" ]
then
  echo Restarting SQL Server...
  sudo systemctl restart mssql-server
  sudo systemctl status mssql-server
fi

echo Done!
