# Ansible Variables

For this step we are going to use a variable.  Ansible supports variables to store values that can be used in playbooks. Variables can be defined in a variety of places and have a clear precedence. Ansible substitutes the variable with its value when a task is executed.

Variable names should be letters, numbers, and underscores. Variables should always start with a letter.

Specifically for this exercise we are going to use a [magic variable](https://docs.ansible.com/ansible/latest/reference_appendices/special_variables.html#magic) called `inventory_hostname`.  For this exercise the `inventory_hostname` for host02 will be `host02` and for host03 will be `host03`.

## Examine the Ansible Playbook

This exercise has provided another already complete Ansible Playbook.  To examine this playbook use the Linux `cat` command

`cat hostname.yml`{{execute}}

Here is the output:

```yaml
---
- name: change hostnames
  hosts: web
  become: true
  tasks:

  - name: change hostnames for device
    hostname:
      name: "{{inventory_hostname}}"
```

This Ansible Playbook is exactly the same as the previous playbook except for two things.  

- It is executed on the group `web` which contains both `host02` and `host03`.
- The name field is now using a **variable** as identified with the open brackets `{{` and close brackets `}}`.

## Execute the Ansible Playbook

Use the `ansible-playbook` command to execute the playbook:

`ansible-playbook hostname.yml`{{execute}}

Take note that the Ansible Playbook simultaneously runs on both hosts at the same time.  This will take the same amount of time to run on two hosts as two hundreds hosts.

## Verify hostnames changed

To verify the hostname did indeed change, login to each host:

### host02

SSH to host02 using the linux command `ssh`:

`ssh host02`{{execute}}

Verify that the hostname has changed, you should use 
`[root@host02 ~]#`

Type exit to return back to the control node.

`exit`{{execute}}

### host03

SSH to host03 using the linux command `ssh`:

`ssh host03`{{execute}}

Verify that the hostname has changed, you should use
`[root@host03 ~]#`

Type exit to return back to the control node.

`exit`{{execute}}
