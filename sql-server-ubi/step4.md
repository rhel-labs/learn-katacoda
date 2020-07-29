# Deploy the client-tools container

Now, let's run our ansible playbook defined in the site.yml file and pass it the list of hosts

`ansible-playbook -i myhosts site.yml`{{execute}}

> The playbook has several tasks, and some tasks could take a bit longer than usual.

The output of the run playbook should look like below -

<pre class="file">
PLAY [Setup SQL server] ************************************************************************

TASK [Gathering Facts] *************************************************************************
...

TASK [dpredhat.ansible_role_mssql : Create a new database] *************************************

PLAY RECAP *************************************************************************************
localhost                  : ok=15   changed=11   unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
</pre>
