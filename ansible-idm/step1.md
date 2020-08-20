# Exploring and understanding the lab environment

 You have access to the following hosts:

| Role                 | Inventory name | IP Address     |
| ---------------------| ---------------| ---------------|
| Ansible Control node | host01         | `[[HOST1_IP]]` |
| Managed host 2       | host02         | `[[HOST2_IP]]` |
| Managed host 3       | host03         | `[[HOST3_IP]]` |

A control node is any machine with Ansible installed. All three nodes are running Red Hat Enterprise Linux 8. To see what version of Red Hat Enterprise is running on the server use the Linux `cat` command to examine the `/etc/redhat-release` file.    

`cat /etc/redhat-release`{{execute}}

# Examining /etc/hosts

For this lab environment we will be using hostnames.  This is accomplished via host mapping in the `/etc/hosts` file.  Use the Linux `cat` command to examine the `/etc/hosts` file:

`cat /etc/hosts`{{execute}}

Take note of the two following lines:

```
[[HOST2_IP]] host02 node01
[[HOST3_IP]] host03 node02
```

- The hostname `host02` or `node01` will resolve to `[[HOST2_IP]]`
- The hostname `host03` or `node02` will resolve to `[[HOST3_IP]]`

# Connecting to hosts

If you want to manually login to each host you can ssh to their hostname.

To connect to `host02` use the Linux `ssh` command:

`ssh host02`{{execute}}

Type exit to return back to the control node.

`exit`{{execute}}

To connect to `host03` use the Linux `ssh` command:

`ssh host03`{{execute}}

Type exit to return back to the control node.

`exit`{{execute}}
