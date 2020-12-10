# Inspecting a pre-made example and applying it

`cat soe.yml`{{execute}}

<pre class="file">
---
- hosts: localhost
  vars:
    kernel_settings_sysctl:
      - name: vm.swappiness
        value: 20
      - name: vm.dirty_ratio
        value: 40
      - name: vm.dirty_expire_centisecs
        value: 500
      - name: vm.dirty_writeback_centisecs
        value: 100
      - name: kernel.sem
        value: "250 32000 100 128"
    tlog_scope_sssd: all
  roles:
    - role: rhel-system-roles.kernel_settings
    - role: rhel-system-roles.tlog
</pre>

`cat /proc/sys/vm/swappiness`{{execute}}

<pre class="file">
30
</pre>

`ansible-playbook soe.yml`{{execute}}

<pre class="file">
PLAY [localhost] *************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************
ok: [localhost]

<<< OUTPUT ABRIDGED >>>

PLAY RECAP *******************************************************************************************************************************
localhost                  : ok=16   changed=9    unreachable=0    failed=0    skipped=7    rescued=0    ignored=0
</pre>
