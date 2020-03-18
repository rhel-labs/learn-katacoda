# Run the Ansible Playbook

Now, let's run our ansible playbook defined in the site.yml file and pass it the list of hosts

`ansible-playbook -i myhosts site.yml`{{execute}}

The playbook has several tasks, and some tasks could take a bit longer than usual.

For example, we attempt to update all the system packages to latest using yum update. We then monitor the progress of this update, so you might see something like the output below. This is expected as we monitor the update task to complete. 

<pre class="file">
TASK [dpredhat.ansible_role_mssql : Check progress of update] **********************************
FAILED - RETRYING: Check progress of update (N retries left).
</pre>
