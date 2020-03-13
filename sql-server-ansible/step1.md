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

In this demo you have access to one host named host01. To let Ansible know about it, put its hostname in an inventory file.

1. We'll call our inventory file myhosts, and you'll add one group called group1:

`echo "[group1]" > myhosts`{{execute}}

2. Then, add the host to the group, while also passing the username to use for SSH access, as an inventory parameter.

`echo ``hostname`` ansible_ssh_user=cent" >> myhosts`{{execute}}

3. You can use your terminal to verify that myhosts has been created: `cat myhosts`{{execute}}

4. You can also run the following command to verify that your inventory is working properly:

`ansible all -i myhosts -m ping`{{execute}}

The response should look be:

<pre class="file">
<hostname> | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
</pre>

So, now that we have confirmed Ansible is properly configured, let's look at Ansible Playbooks.
