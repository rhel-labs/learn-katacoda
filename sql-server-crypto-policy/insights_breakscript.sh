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
if [ "$1" == "0" ]
then
    echo Install Setting up insights
    sudo yum install -y insights-client
    sudo subscription-manager register --force

elif [ "$1" == "1" ]
then
    echo Breaking rule /var/opt/mssql permissions is not correct
    sudo chown root:root /var/opt/mssql

elif [ "$1" == "2" ]
then
    echo Fixing to use tuned profile for mssql
    sudo yum install tuned-profiles-mssql
    sudo tuned-adm profile mssql

elif [ "$1" == "3" ]
then
    echo Nothing here to do - TBD 
fi

# Restart SQL Server after installing:
if [ "$1" != "" ]
then
  echo Restarting SQL Server...
  sudo systemctl stop mssql-server
  sudo systemctl start mssql-server
  sudo systemctl status mssql-server --no-pager

  echo Submit insights report
  if [ "$1" == "0" ]
  then
    sudo insights-client --register
  else
    sudo insights-client
