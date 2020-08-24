# Install the IPA Server and Client

A FreeIPA server provides centralized authentication, authorization and account information by storing data about user, groups, hosts and other objects necessary to manage the security aspects of a network of computers. 

To install the FreeIPA server using ansible -

`ansible-playbook -v -i ~/hosts ansible-freeipa/playbooks/install-server.yml`{{execute}}

Here is an abridged output:
```
<< OUTPUT ABRIDGED >>
```

 - `inventory`: shows the location of the Ansible Inventory being used


For a full list of all Ansible configuration settings please refer to the [documentation](https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings)
