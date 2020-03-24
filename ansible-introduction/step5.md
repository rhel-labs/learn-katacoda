# Ansible Playbook Overview

Playbooks are Ansible’s configuration, deployment, and orchestration language. They can describe a policy you want your remote systems to enforce, or a set of steps in a general IT process.

## Ansible Playbook components

A playbook is where you can take some of those ad-hoc commands you just ran and put them into a repeatable set of *plays* and *tasks*.

Playbooks are text files written in YAML format and therefore need:

  - to start with three dashes (`---`)

  - proper indentation using spaces and **not** tabs\!

There are some important concepts:

  - **hosts**: the managed hosts to perform the tasks on

  - **tasks**: the operations to be performed by invoking Ansible modules and passing them the necessary options.

  - **become**: privilege escalation in Playbooks, same as using `-b` in the ad hoc command.

## Examine the Ansible Playbook

This exercise has provided an already complete Ansible Playbook.  To examine this playbook use the Linux `cat` command

`cat playbook.yml`{{execute}}

Lets examine the play:

```yaml
---
- name: change hostname
  hosts: control_node
  become: true
  tasks:
```

- `---` identifies this file as YAML
- `- name: change hostname` is a description of this Ansible Playbook printed to the terminal window
- `hosts: control_node` means this playbook will execute against the group `[control_node]` which contains one host, `host01`
- `become: true` gives this Ansible Playbook to run with privilege escalation, by default this is root
- `tasks:` starts where a list of tasks will be provided.

This Ansible Playbook has one task.

```yaml
  - name: change hostnames for device
    yum:
      name: "control"
```

- `- name:` is where we give a description of this task that is printed to the terminal window
- `yum:` is the module that this task uses.  Tasks and modules have a one-to-one correlation.  Click here for more information on the [yum module](https://docs.ansible.com/ansible/latest/modules/yum_module.html).
- `name: "control"` - is a parameter we provide to the `yum` module.  The key is name and the string `"control"` is provided as the value.  This means the hostname of the control node will be changed to `control`

## Execute the Ansible Playbook

Use the `ansible-playbook` command to execute the playbook:

`ansible-playbook playbook.yml`{{execute}}
