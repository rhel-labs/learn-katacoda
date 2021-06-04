# Inspecting a pre-made example and applying it

To get started, an already created playbook has been created that uses both the
kernel-settings and session recording system roles.  You can inspect the 
contents of this lab provided playbook to get some more information about what 
it will do on your system.

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

From the above output, this playbook will only affect `localhost`.  Also, at 
the bottom, you will notice the roles included, `kernel_settings` and `tlog`
(session recording) in the playbook.  Because these are the only roles included
in the playbook, the `vars` section has variables that are used by these roles.

The `vars` under the kernel_settings_sysctl section are the values of parameters
to set on the system to change kernel tunables in the /proc/sys directory
structure.  The tlog_scope_sssd setting will enable session recording for
all users on the system.

Before you run the playbook and adjust the settings of the system, verify the
current setting for one of the playbook affected values `vm.swappiness`.

`cat /proc/sys/vm/swappiness`{{execute}}

<pre class="file">
30
</pre>

The current value stored in the swappiness kernel is 30, but after you run the
playbook, it should be updated to be 20.

>*NOTE:* swappiness is a setting that determines the kernel's preference for using swap space on the system, the value is between 0-100.  The smaller the value, the less preference the kernel has for utilizing swap space.

Execute the playbook that includes our updated settings deployed through RHEL 
System Roles.

`ansible-playbook soe.yml`{{execute}}

<pre class="file">
PLAY [localhost] *************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************
ok: [localhost]

<<< OUTPUT ABRIDGED >>>

PLAY RECAP *******************************************************************************************************************************
localhost                  : ok=16   changed=9    unreachable=0    failed=0    skipped=7    rescued=0    ignored=0
</pre>

After a lot of output, you can see from the output at the bottom of the snippet
above, how many elements on the system were changed.

You may have noticed that for session recording, the `tlog` system role managed
installing the software needed for session recording in addition to executing
the configuration parameters included in the playbook.
