# Adding a new role and settings

`echo "    - role: rhel-system-roles.timesync" >> soe.yml`{{execute}}

`sed -ie 's/tlog_scope_sssd: all/tlog_scope_sssd: all\n    timesync_ntp_servers:\n      - hostname: time-d-b.nist.gov\n        iburst: yes\n      - hostname: 0.rhel.pool.ntp.org\n        iburst: yes/' soe.yml`{{execute}}

`cat soe.yml`{{execute}}

`chronyc sources`{{execute}}

`ansible-playbook soe.yml`{{execute}}

`chronyc sources`{{execute}}
