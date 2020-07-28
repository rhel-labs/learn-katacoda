# Validate the environment
>For this scenario, we have started installing ansible in the background. The background task will take between 2-5 minutes to complete. 

To check if ansible installation is complete, we can use the following command -
`ansible --version`{{execute}}

You should see output like below -

<pre class="file">
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.6/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.6.8 (default, Jan 11 2019, 02:17:16) [GCC 8.2.1 20180905 (Red Hat 8.2.1-3)]
</pre>


In Ansible, the inventory represents machines that Ansible will manage. In this example, we will create a inventory file called 'myhosts' and add one group called [[sqlgroup]]. 

`echo "[sqlgroup]" > myhosts`{{execute}}

Next, add the host to the group.You can have multiple machines under a group, but for this scenario we will have only one machine (i.e. localhost).

`echo localhost ansible_connection=local >> myhosts`{{execute}}

Verify that the myhosts file has been created: `cat myhosts`{{execute}}

Next, use the ping module to verify that your inventory is working properly:

`ansible all -i myhosts -m ping`{{execute}}

The response should look be:

<pre class="file">
localhost | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": false,
    "ping": "pong"
}
</pre>

So, now that we have confirmed Ansible is properly configured, let's look at Ansible Playbooks.
