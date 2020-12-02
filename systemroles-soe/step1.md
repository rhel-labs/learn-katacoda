`subscription-manager  repos --enable=ansible-2.9-for-rhel-8-x86_64-rpms`{{execute host01}}
`ssh host02 'subscription-manager  repos --enable=ansible-2.9-for-rhel-8-x86_64-rpms'`{{execute}}
`ssh host03 'subscription-manager  repos --enable=ansible-2.9-for-rhel-8-x86_64-rpms'`{{execute}}

`yum -y install ansible rhel-system-roles`{{execute}}
`ssh host02 'yum -y install ansible rhel-system-roles'`{{execute}}
`ssh host03 'yum -y install ansible rhel-system-roles'`{{execute}}
