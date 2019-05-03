set -e

# subscription-manager refresh
# subscription-manager list --all --available
# export token=$(subscription-manager list --all --available --matches '*Red Hat Enterprise Linux Server*' | grep "Pool ID" | head -n1 | cut -d ':' -f 2 | xargs)
# export token=$(subscription-manager list --all --available --matches '*Red Hat Enterprise Linux Developer Suite*' | grep "Pool ID" | head -n1 | cut -d ':' -f 2 | xargs)
# echo $token
# subscription-manager attach --pool=$token

# subscription-manager repos --list
# subscription-manager repos --enable=*

echo "[BaseOS]" >> /etc/yum.repos.d/installer.repo
echo "name=BaseOS" >> /etc/yum.repos.d/installer.repo
echo "baseurl=file:///run/media/smcbrien/RHEL-8-0-0-BaseOS-x86_64/BaseOS" >> /etc/yum.repos.d/installer.repo
echo "gpgcheck=0" >> /etc/yum.repos.d/installer.repo
echo "enabled=1" >> /etc/yum.repos.d/installer.repo
echo "" >> /etc/yum.repos.d/installer.repo
echo "[AppStream]" >> /etc/yum.repos.d/installer.repo
echo "name=Application Stream" >> /etc/yum.repos.d/installer.repo
echo "baseurl=file:///run/media/smcbrien/RHEL-8-0-0-BaseOS-x86_64/AppStream" >> /etc/yum.repos.d/installer.repo
echo "gpgcheck=0" >> /etc/yum.repos.d/installer.repo
echo "enabled=1" >> /etc/yum.repos.d/installer.repo

mkdir -p /run/media/smcbrien/RHEL-8-0-0-BaseOS-x86_64
mount /dev/sr0 /run/media/smcbrien/RHEL-8-0-0-BaseOS-x86_64
