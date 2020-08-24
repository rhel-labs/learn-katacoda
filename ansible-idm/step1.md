# Exploring and understanding the lab environment

>**Note:** For this scenario, we have started installing ansible and performing an yum update in the background. The background task will take between 2-5 minutes to complete. 

In this lab environment, we have provisioned 3 nodes as shown below -

| Role                 | Inventory name | IP Address     |
| ---------------------| ---------------| ---------------|
| Ansible Control node | host01         | `[[HOST1_IP]]` |
| Managed host 2       | host02         | `[[HOST2_IP]]` |
| Managed host 3       | host03         | `[[HOST3_IP]]` |

A control node is any machine with ansible installed.  We will be using *host02* to deploy the IdM server, and *host03* to deploy the IdM client. 

> __NOTE__ : In production, IdM replicas are typically deployed for scale and high-availability reasons. However, in this lab, we will only
be deploying a single instance of the IdM server.

# Determining	connectivity of the hosts

To determine connectivity from the control node to managed hosts, use the ansible [ping module](https://docs.ansible.com/ansible/latest/modules/ping_module.html).

`ansible web -m ping`{{execute}}

The output will look like the following:

```
host03 | SUCCESS => {
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
```

You will see green return values in the terminal window with the hostname and **SUCCESS**.
