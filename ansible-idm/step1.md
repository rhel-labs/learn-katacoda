# Exploring and understanding the lab environment

Red Hat Identity Manager (IdM), is designed to provide an integrated identity management service for a wide range of clients, including Linux, Mac, and even Windows. At its core, IdM combines LDAP, Kerberos, DNS, and PKI with a rich management framework. 

>**Note:** For this scenario, we have started installing ansible and performing an yum update in the background. The background task will take between couple of minutes to finish.  

In this lab environment, we have provisioned 3 nodes as shown below -

| Role                 | Inventory name | IP Address     |
| ---------------------| ---------------| ---------------|
| Ansible Control node | host01         | `[[HOST1_IP]]` |
| IdM Server           | host02         | `[[HOST2_IP]]` |
| IdM Client           | host03         | `[[HOST3_IP]]` |

A control node is any machine with ansible installed.  We will be using *host02* to deploy the IdM server, and *host03* to deploy the IdM client. 

# Determining connectivity of the hosts

To determine connectivity across the hosts, use the ansible [ping module](https://docs.ansible.com/ansible/latest/modules/ping_module.html).

`ansible all -m ping`{{execute T2}}

The output will look like the following:

```
host01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": false,
    "ping": "pong"
}
host02 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": false,
    "ping": "pong"
}
host03 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": false,
    "ping": "pong"
}
```

You will see green return values in the terminal window with the hostname and **SUCCESS**.
