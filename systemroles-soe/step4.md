# Adding a new role and settings

In this step, you will be making changes to the playbook.  To refresh your
memory, take a look at the initial playbook included by the lab.

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

Now, add an additional configuration so that the timesync role can be used by
the playbook.  Add the listing for the new role to the bottom of the playbook.

`echo "    - role: rhel-system-roles.timesync" >> soe.yml`{{execute}}

Now that the timesync role is configured in the playbook, you can add settings
in the variable section to be used by this role.  In the command below, sed is
used to add the timesync_ntp_servers section and hostname and iburst variables
to the playbook.

`sed -ie 's/tlog_scope_sssd: all/tlog_scope_sssd: all\n    timesync_ntp_servers:\n      - hostname: time-d-b.nist.gov\n        iburst: yes\n      - hostname: 0.rhel.pool.ntp.org\n        iburst: yes/' soe.yml`{{execute}}

Now that the timesync role and component variables have been added to the
playbook, take a look at the updated playbook.

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

When the playbook is next run, the system should be configured to use the
time-d-b.nist.gov and a timeserver from the pool at ntp.org.

Before running the playbook, verify the current settings being used by
the system with `chronyc`.

`chronyc sources`{{execute}}

<pre class="file">
210 Number of sources = 8
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
^- 185.168.228.59                2   6   373    46  +1636us[+1640us] +/-   46ms
^- nono.com                      2   6   377    46  -1189us[-1185us] +/-   32ms
^+ mail.jabber-germany.de        3   6   377    46  -1583us[-1579us] +/- 7796us
^+ www.kashra.com                1   6   373    45  -1288us[-1285us] +/- 9518us
^? server1.sim720.co.uk          2   7    40   310   +598us[+18000s] +/-   26ms
^+ de-user.deepinid.deepin.>     3   6   377    45  +1508us[+1508us] +/-   10ms
^* littlericket.me               2   6   377    45  +1115us[+1119us] +/- 5424us
^- stratum2-4.NTP.TechFak.U>     2   6   377    44  -2309us[-2309us] +/-   13ms
</pre>

From the above output, yours may be slightly different, your lab system has a
variety of pool systems from ntp.org assigned for the time servers.

Now execute the updated playbook to apply the changes you have added.

`ansible-playbook soe.yml`{{execute}}

<pre class="file">
PLAY [localhost] *************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************
ok: [localhost]

<<< OUTPUT ABRIDGED >>>

PLAY RECAP *******************************************************************************************************************************
localhost                  : ok=28   changed=4    unreachable=0    failed=0    skipped=23   rescued=0    ignored=6
</pre>

From the above snippet of output, you can see that only 4 items were changed 
once the playbook was executed.  These changes should have been the updated
time server settings.

You can verify that your system now uses the updated timeserver settings by
using `chronyc`.

`chronyc sources`{{execute}}

<pre class="file">
210 Number of sources = 2
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
^+ time-d-b.nist.gov             1   6    37    20  -1430us[-1430us] +/-   67ms
^* beteigeuze.pmsf.net           2   6    37    21   +353us[ +483us] +/-   40ms
</pre>

As expected, the system is now configured to use time-d-b.nist.gov and a system
assigned from the pool at ntp.org.
