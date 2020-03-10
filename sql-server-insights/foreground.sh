curl -o /root/install_sql.sh https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/sql-server-crypto-policy/install_sql2019.sh 
sudo chmod +x ./install_sql.sh

curl -o /root/insights_breakscript.sh https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/sql-server-crypto-policy/insights_breakscript.sh 
sudo chmod +x ./insights_breakscript.sh

sudo ./install_sql.sh
export HOSTNAME=`hostname --all-fqdns`
