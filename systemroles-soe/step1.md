`for i in localhost host02 host03; do ssh $i 'subscription-manager  repos --enable=ansible-2.9-for-rhel-8-x86_64-rpms'; done`{{execute}}

`for i in localhost host02 host03; do ssh $i 'yum -y install ansible rhel-system-roles'`{{execute}}
