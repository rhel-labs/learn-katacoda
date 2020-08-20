# The Ansible Configuration File

This step will help you locate and understand the Ansible configuration file (`ansible.cfg`)

The behavior of Ansible can be customized by modifying settings in Ansible’s ini-style configuration file.

For this lab environment there is already a provided `ansible.cfg` configured in the home directory on the control node:

`cat ansible.cfg`{{execute}}

Here is an abridged output:
```
inventory = hosts
<< OUTPUT ABRIDGED >>
```

 - `inventory`: shows the location of the Ansible Inventory being used


For a full list of all Ansible configuration settings please refer to the [documentation](https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings)
