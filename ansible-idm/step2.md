# Getting Ansible Playbooks for FreeIPA

**FreeIPA** is a free and open source identity management system. *FreeIPA* is the upstream open-source project for Red Hat Identity Manager.

Run the ansible command with the --version flag to see not only the version of Ansible that's installed, but also a few other key details:

`ansible --version`{{execute T1}}

The output will look similar to the following:

```
[root@c01c899604a3 ~]# ansible --version
ansible 2.9.11
  config file = /root/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.6/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.6.8 (default, Dec  5 2019, 15:45:45) [GCC 8.3.1 20191121 (Red Hat 8.3.1-5)]
```
# Download the Ansible FreeIPA collection

Collections are a distribution format for Ansible content that can include playbooks, roles, modules, and plugins. You can install and use collections through [Ansible Galaxy](https://galaxy.ansible.com/). 

To access Ansible Galaxy, ansible ships with a command line tool called **ansible-galaxy** that can be used to download and install the *freeipa.ansible_freeipa* collection

`ansible-galaxy install freeipa.ansible_freeipa --force`{{execute T1}}

Symbolic link the folder to make it easily accessible 

`ln -s .ansible/collections/ansible_collections/freeipa/ansible_freeipa/ ansible-freeipa`{{execute T1}}

List the available playbooks in the FreeIPA collection

`ls ansible-freeipa/playbooks/`{{execute T1}}

