# View and edit the Ansible Playbook

**Playbook**
A playbook is an entirely different way of running Ansible, that is far more powerful. In Ansible, a playbook is a text file consisting of multiple plays.

A play is a set of tasks mapped to a set of hosts.

**Editing variables in a playbook**

In this example, you can edit the /vars/main.yml file to change some of the different variables for the setup. For example, changing the sa user password.

<pre class="file">
...
db_password: P@ssWORD!
...
</pre>

