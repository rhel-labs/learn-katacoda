echo "Installing RHEL8 Packages"
sudo yum install -y buildah podman wget vim emacs git sudo tmux cockpit ca-certificates httpd mod_ssl

# To speed up installation of bcc-tools lets pre-install some dependencies
sudo yum install -y gcc llvm-libs gcc-c++ cpp binutils


sudo systemctl enable --now cockpit.socket

adduser rhel
sudo usermod -aG wheel rhel
echo redhat | sudo passwd --stdin rhel

touch /home/rhel/.hushlogin
mkdir /home/rhel/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCqogWTBOZvsLcz7Zxz7i4+Z00WA01Y+xpNsvUiC6bkB8F4PhuVkKMn+ww7F/UtLcQ9qO6U1K8f5FpkDmeQQLvV7uYCnG7X63ia+njPgF8euF5rpWvmjG5Zz/6gLGf8+wFNC4yXyjU7G7Vce59/JdbaPUdOmA3aL2WKMxoea/IDOTEAORFcyMLNNJdy0yYNxLfEl7w3IY12po/cPb2VKeqJqi3UqwJroDYjCOt5fS4Fp0tvzvbiXP8+nbhd0uTTEkgtl3/FU0ozQBAHgO6UlbSV1sJEIjZG+543FtRfV0tbmUyT7+N0NGOZYJ3FQ1B/MrP6H8O/8YhiaQDLwkL5zhxPqW9cyAZw207uZbM26ohfCQUMmFoYJ9fBA/dt7aXbw5rb0lihFYZMq94NUi3ABLDBEsT9J5+mJomdlUHDwHxztcjO8JnThP5iBcYmNiqAnhbn71Avr8Zz1vHVP0TFC8f40NnK/A7nwTQw0aQ+H0u+EGrx+2gVmSUlwQyDDUlHJpEI0IefWtdmBqYvMyfVDf8SGSolkcXUJxX63iCFEyPMyMLUWLbPcwRhlUn6G6NVDI6sLwfveeXFJppuSMx+Wqc3ZmyEHIj/mVuEuygVke3Bd4/v8e4o6adR93yF/Fuq0Q0bMhgf2xCwVFSaqlta/o5m0wMNwCO3NuDLCZjIFj3+vw== course@katacoda.com' >> /home/rhel/.ssh/authorized_keys
echo 'rhel    ALL=(ALL)       NOPASSWD: ALL' >>  /etc/sudoers

echo "Install SQL Server"
sudo curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server-2017.repo
sudo yum install -y mssql-server
