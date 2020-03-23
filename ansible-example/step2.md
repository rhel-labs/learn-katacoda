# The Ansible Configuration File

This step will help you locate and understand the Ansible configuration file (`ansible.cfg`)

The Ansible.cfg The behavior of Ansible can be customized by modifying settings in Ansible’s ini-style configuration file. Ansible will select its configuration file from one of several possible locations on the control node, please refer to the [documentation](https://docs.ansible.com/ansible/latest/reference_appendices/config.html).

For this lab environment there is already a provided `ansible.cfg` configured in the home directory on the control node:

`cat ansible.cfg`{{execute}}

Note the following parameters within the `ansible.cfg` file:

 - `inventory`: shows the location of the Ansible Inventory being used
 - `stdout_callback`: is switched from the default of JSON to YAML

For a full list of all Ansible configuration settings please refer to the [documentation](https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings)
