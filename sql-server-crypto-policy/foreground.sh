curl -o /root/install_sql.sh https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/sql-server-crypto-policy/install_sql.sh 
sudo chmod +x ./install_sql.sh
sudo ./install_sql.sh
export HOSTNAME=`hostname --all-fqdns`
