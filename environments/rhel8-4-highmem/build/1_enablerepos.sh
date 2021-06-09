  
set -e

subscription-manager refresh
subscription-manager list --all --available
export token=$(subscription-manager list --all --available --matches '*Red Hat Enterprise Linux Server*' | grep "Pool ID" | head -n1 | cut -d ':' -f 2 | xargs)
echo $token
subscription-manager attach --pool=$token
subscription-manager repos --list
subscription-manager repos --enable=rhel-8-for-x86_64-supplementary-rpms
