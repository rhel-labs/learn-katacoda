# Update an existing setting

`sed -ie 's/value: 20/value: 10/' soe.yml`{{execute}}

`cat soe.yml`{{execute}}

<pre class="file">
---
- hosts: localhost
  vars:
    kernel_settings_sysctl:
      - name: vm.swappiness
        value: 10
      - name: vm.dirty_ratio
        value: 40
      - name: vm.dirty_expire_centisecs
        value: 500
      - name: vm.dirty_writeback_centisecs
        value: 100
      - name: kernel.sem
        value: "250 32000 100 128"
    tlog_scope_sssd: all
    timesync_ntp_servers:
      - hostname: time-d-b.nist.gov
        iburst: yes
      - hostname: 0.rhel.pool.ntp.org
        iburst: yes
  roles:
    - role: rhel-system-roles.kernel_settings
    - role: rhel-system-roles.tlog
    - role: rhel-system-roles.timesync
</pre>

`ansible-playbook soe.yml`{{execute}}

<pre class="file">
PLAY [localhost] *************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************
ok: [localhost]

<<< OUTPUT ABRIDGED >>>

PLAY RECAP *******************************************************************************************************************************
localhost                  : ok=30   changed=2    unreachable=0    failed=0    skipped=25   rescued=0    ignored=6

</pre>

`cat /proc/sys/vm/swappiness`{{execute}}

<pre class="file">
10
</pre>
