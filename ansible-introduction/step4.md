# Ansible Inventory

This step will have you locate and understand an ini formatted inventory file.

Examine the Ansible inventory file in the home directory.  Use the Linux `cat` command to example the `/root/hosts` file:

`cat /root/hosts`{{execute}}

For the purposes of this exercise the passwords are provided here in plain-text.  In production you can use the Red Hat Ansible Platform to encrypt passwords using [credential management](https://docs.ansible.com/ansible-tower/latest/html/userguide/credentials.html).  Credential management with Ansible can also be fully integrated into CyberArk or Vault by HashiCorp.

There is an default group named `[all]`.  This means all hosts are part of the **all** group. To define variables in a group you can use the `:vars` which will apply these variables to all members of the group.

```
[all:vars]
ansible_user=root
ansible_ssh_pass=katacoda
```
Next we have two groups, one of the control node, just containing `host01`
```
[control_node]
host01 ansible_host=localhost ansible_connection=local
```

The `host01` node has two host vars (or variables specific to this individual host).

- `ansible_host` this is an optional variable where if your Ansible inventory name does not match your DNS name you can hardcode the DNS name or an IP address.
- `ansible_connection` - this means the host is using the local connection rather than the default SSH.  Other values include `network_cli` for network devices like a Cisco Router or `winrm` to run tasks over Microsoft's WinRM.  For a full list [check the documentation.](https://docs.ansible.com/ansible/latest/plugins/connection.html)

and finally there is one group named `web` with our two managed hosts

```
[web]
host02
host03
```
