echo "Installing RHEL8 Packages"
sudo yum update
sudo yum install -y buildah podman wget vim emacs tmux cockpit

# To speed up installation of bcc-tools lets pre-install some dependencies
sudo yum install -y gcc llvm-libs gcc-c++ cpp binutils
