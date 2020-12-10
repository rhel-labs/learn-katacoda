# Adding a new role and settings

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

`echo "    - role: rhel-system-roles.timesync" >> soe.yml`{{execute}}

`sed -ie 's/tlog_scope_sssd: all/tlog_scope_sssd: all\n    timesync_ntp_servers:\n      - hostname: time-d-b.nist.gov\n        iburst: yes\n      - hostname: 0.rhel.pool.ntp.org\n        iburst: yes/' soe.yml`{{execute}}

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

`ansible-playbook soe.yml`{{execute}}

<pre class="file">
PLAY [localhost] *************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************
ok: [localhost]

<<< OUTPUT ABRIDGED >>>

PLAY RECAP *******************************************************************************************************************************
localhost                  : ok=28   changed=4    unreachable=0    failed=0    skipped=23   rescued=0    ignored=6
</pre>

`chronyc sources`{{execute}}

<pre class="file">
210 Number of sources = 2
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
^+ time-d-b.nist.gov             1   6    37    20  -1430us[-1430us] +/-   67ms
^* beteigeuze.pmsf.net           2   6    37    21   +353us[ +483us] +/-   40ms
</pre>
