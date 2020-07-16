echo "Installing RHEL8 Packages"
sudo yum install -y buildah podman wget vim emacs git sudo tmux cockpit ca-certificates httpd mod_ssl

# To speed up installation of bcc-tools lets pre-install some dependencies
sudo yum install -y gcc llvm-libs gcc-c++ cpp binutils bash-completion

sudo systemctl enable --now cockpit.socket

adduser rhel
sudo usermod -aG wheel rhel
echo redhat | sudo passwd --stdin rhel

touch /home/rhel/.hushlogin
mkdir /home/rhel/.ssh
echo 'rhel    ALL=(ALL)       NOPASSWD: ALL' >>  /etc/sudoers
