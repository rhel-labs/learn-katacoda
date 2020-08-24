# Examine Ansible software version

Run the ansible command with the --version flag to see not only the version of Ansible that's installed, but also a few other key details:

`ansible --version`{{execute}}

The output will look similar to the following:

```
[root@c01c899604a3 ~]# ansible --version
ansible 2.9.6
  config file = /root/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.6/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.6.8 (default, Jan 11 2019, 02:17:16) [GCC 8.2.1 20180905 (Red Hat 8.2.1-3)]
```
# Download the Ansible Role

Ansible uses the concept of **roles** to better allow modular code and avoid repeating yourself. A role is simply a folder structure that Ansible knows where to load vars files, tasks and handlers from. 

Ansible makes it easily share roles with the community or download roles that have been created by other members of the community using [Ansible Galaxy](https://galaxy.ansible.com/). 

To access Ansible Galaxy, ansible ships with a command line tool called **ansible-galaxy** that can be used to install roles in a specific role directory

`ansible-galaxy collection install freeipa.ansible_freeipa --force`{{execute}}
