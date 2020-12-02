# Update an existing setting

`sed -ie 's/value: 20/value: 10/' soe.yml`{{execute}}

`cat soe.yml`{{execute}}

`ansible-playbook soe.yml`{{execute}}

`cat /proc/sys/vm/swappiness`{{execute}}
