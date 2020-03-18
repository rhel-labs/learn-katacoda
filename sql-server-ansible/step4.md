# Run the Ansible Playbook

Now, let's run our ansible playbook defined in the site.yml file and pass it the list of hosts

`ansible-playbook -i myhosts site.yml`{{execute}}

The playbook has several tasks, and some tasks could take a bit longer than usual.

<pre class="file">
PLAY [Setup SQL server] ************************************************************************

TASK [Gathering Facts] *************************************************************************
...

</pre>
