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

The inventory file 'hosts' defines the nodes in which SQL Server should be configured. In this example, we will call our inventory file myhosts, and we will add one group called [[sqlgroup]]:

`echo "[sqlgroup]" > myhosts`{{execute}}

Next, add the host to the group.

`echo localhost ansible_connection=local >> myhosts`{{execute}}

You can use your terminal to verify that myhosts has been created: `cat myhosts`{{execute}}

You can also run the following command to verify that your inventory is working properly:

`ansible all -i myhosts -m ping`{{execute}}

The response should look be:

<pre class="file">
<hostname> | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
</pre>

So, now that we have confirmed Ansible is properly configured, let's look at Ansible Playbooks.
