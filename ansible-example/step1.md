# Exploring and understanding the lab environment

In this lab you work in a pre-configured lab environment. You will have access to the following hosts:

| Role                 | Inventory name | IP Address     |
| ---------------------| ---------------| ---------------|
| Ansible Control node | host01         | `[[HOST1_IP]]` |
| Managed host 1       | host02         | `[[HOST2_IP]]` |
| Managed host 2       | host03         | `[[HOST3_IP]]` |

# Examine Ansible software version

Run the ansible command with the --version flag to see not only the version of Ansible that's installed, but also a few other key details:

`ansible --version`{{execute}}

Take note of the config file
```
config file = /root/ansible.cfg
```
