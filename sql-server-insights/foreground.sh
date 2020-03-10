curl -o /root/install_sql.sh https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/sql-server-crypto-policy/install_sql.sh 
sudo chmod +x ./install_sql.sh

sudo ./install_sql.sh
export HOSTNAME=`hostname --all-fqdns`

RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${RED}Breaking insight rule for user, group permissions to /var/opt/mssql${NC}"
sudo chown root:root /var/opt/mssql
