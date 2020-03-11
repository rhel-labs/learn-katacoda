# Validate the Environment
Using the provided system terminal session, validate the initial environment. 

Run the ansible command with the --version flag to see not only the version of Ansible that's installed, but also a few other key details:

`ansible --version`{{execute}}

<pre class="file">
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.6/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.6.8 (default, Jan 11 2019, 02:17:16) [GCC 8.2.1 20180905 (Red Hat 8.2.1-3)]
</pre>

This output will become more useful the deeper you get into Ansible.
