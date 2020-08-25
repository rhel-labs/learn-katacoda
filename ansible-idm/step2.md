# Getting Ansible playbooks for FreeIPA

**FreeIPA** is a free and open source identity management system. *FreeIPA* is the upstream open-source project for Red Hat Identity Manager (IdM).

Run the ansible command with the --version flag to see not only the version of Ansible that's installed, but also a few other key details:

`ansible --version`{{execute T1}}

The output will look similar to the following:

```
[root@c01c899604a3 ~]# ansible --version
ansible 2.8.13
  config file = /root/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.6/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.6.8 (default, Jan 11 2019, 02:17:16) [GCC 8.2.1 20180905 (Red Hat 8.2.1-3)]
```
# Download the FreeIPA ansible roles

Clone the FreeIPA ansible repository using *git*. The repository has all the necessary playbooks needed to deploy or undeploy server, replicas and clients.

`git clone https://github.com/freeipa/ansible-freeipa.git`{{execute T1}}

List the playbooks that are available to be used. 

`ls ansible-freeipa/playbooks/`{{execute T1}}

