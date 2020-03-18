# View and edit the Ansible Playbook

**Playbook**
A playbook is an entirely different way of running Ansible, that is far more powerful. In Ansible, a playbook is a text file consisting of multiple plays.

A play is a set of tasks mapped to a set of hosts.

**Editing variables in a playbook**

In this example, you can edit `dpredhat.ansible_role_mssql/vars/main.yml`{{open}} file.

This file has several variables, and one example variable that you might want to change is the sa user password.
<pre class="file">
...
db_password: P@ssWORD!
...
</pre>

