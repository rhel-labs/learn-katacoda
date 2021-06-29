# Run the Ansible Playbook

Now, let's run our ansible playbook defined in the site.yml file and pass it the list of hosts

`ansible-playbook -i myhosts site.yml`{{execute}}

> The playbook has several tasks, and some tasks could take a bit longer than usual.

The output of the run playbook should look like below -

<pre class="file">
PLAY [all] ***************************************************************************************

TASK [Gathering Facts] ***************************************************************************
ok: [localhost]

TASK [microsoft.sql.server : Set platform/version specific variables] ****************************
ok: [localhost] => (item=RedHat.yml)
ok: [localhost] => (item=RedHat.yml)
...

RUNNING HANDLER [microsoft.sql.server : Restart the mssql-server service] ************************
changed: [localhost]

PLAY RECAP ***************************************************************************************
localhost                  : ok=34   changed=17   unreachable=0    failed=0    skipped=28   rescued=1    ignored=0  
</pre>
