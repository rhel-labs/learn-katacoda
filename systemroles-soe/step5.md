# Update an existing setting

Now that you have a working ansible playbook to standardize the configuration
of settings on your system, suppose that you realize one of the settings needs
to be changed.

Update the swappiness value in the playbook to be set to 10.  This will lower
the kernel's preference for utilizing swap space.  You might make this change
because you are running a workload, like a database, that benefits from having
more data kept in memory rather than being swapped out to the swap space.

`sed -ie 's/value: 20/value: 10/' soe.yml`{{execute}}

In the above command, you used sed to make an inline edit to the soe.yml file.
You can verify that the change was correctly made by looking at the playbook
contents.

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

Now that the settings have been updated, run the playbook again so that the
changes applied to the system.

`ansible-playbook soe.yml`{{execute}}

<pre class="file">
PLAY [localhost] *************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************
ok: [localhost]

<<< OUTPUT ABRIDGED >>>

PLAY RECAP *******************************************************************************************************************************
localhost                  : ok=30   changed=2    unreachable=0    failed=0    skipped=25   rescued=0    ignored=6

</pre>

After the playbook has completed, you can verify that the change has been
applied to the system.

`cat /proc/sys/vm/swappiness`{{execute}}

<pre class="file">
10
</pre>

This lab has focused on building a playbook using RHEL system roles to generate
a standard set of configuration for the system, then using that playbook to
make further changes to the system.  Now that you have a working playbook it
would be trivial to change the hosts that it applies to from `localhost` to
a set of systems on the network.  As a result, if updates needed to be made
to parameters, like you did to the swappiness setting, for the entire fleet
of systems, you could update the playbook, then execute it across the systems
to propagate the change.
