# View and edit the Ansible Playbook

**Playbook**
A playbook is an entirely different way of running Ansible, that is far more powerful. In Ansible, a playbook is a text file consisting of multiple plays.

A play is a set of tasks mapped to a set of hosts.

**Editing variables in a playbook**

Click to edit ``root/roles/dpredhat.ansible_role_mssql/vars/main.yml``{{open}} in the inline editor.

This file has several variables, and one example variable that you might optionally want to change is the database sa password. 
<pre class="file">
...
db_password: P@ssWORD!
...
</pre>

