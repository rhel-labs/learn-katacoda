#!/bin/bash -e

# Use the following variables to control your install:

# Password for the SA user (required)
MSSQL_SA_PASSWORD='Redhat1!'

# Product ID of the version of SQL server you're installing
# Must be evaluation, developer, express, web, standard, enterprise, or your 25 digit product key
# Defaults to developer
MSSQL_PID='evaluation'

if [ -z $MSSQL_SA_PASSWORD ]
then
  echo Environment variable MSSQL_SA_PASSWORD must be set for unattended install
  exit 1
fi

echo Running yum clean all
sleep 10
sudo yum clean all

echo Adding Microsoft repositories...
#2017 sudo curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server-2017.repo
sudo curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/8/mssql-server-2019.repo

echo Installing Python and OpenSSL
sudo yum install python2 compat-openssl10 -y

echo Running yum update -y...
sleep 10
sudo yum update -y

echo Setting default python version
sudo alternatives --set python /usr/bin/python2

echo Download and Install SQL Server...
sudo yum download mssql-server
sudo rpm -Uvh --nodeps mssql-server*rpm

echo Running mssql-conf setup...
sudo MSSQL_SA_PASSWORD=$MSSQL_SA_PASSWORD \
     MSSQL_PID=$MSSQL_PID \
     /opt/mssql/bin/mssql-conf -n setup accept-eula

#Installing client tools
echo Installing mssql-tools and unixODBC developer...
curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/msprod.repo
sudo ACCEPT_EULA=Y yum install -y mssql-tools unixODBC-devel

echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc

ln -s /usr/lib64/libssl.so.10 /opt/mssql/lib/libssl.so
ln -s /usr/lib64/libcrypto.so.10 /opt/mssql/lib/libcrypto.so

# Configure firewall to allow TCP port 1433:
echo Configuring firewall-rules to allow traffic on port 1433...
sudo firewall-cmd --zone=public --add-port=1433/tcp --permanent
sudo firewall-cmd --reload

# Restart SQL Server after installing:
echo Restarting SQL Server...
sudo systemctl restart mssql-server
sudo systemctl status mssql-server --no-pager

echo Done!
