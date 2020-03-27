# Ansible Playbook Overview

Playbooks are Ansible’s configuration, deployment, and orchestration language. They can describe a policy you want your remote systems to enforce, or a set of steps in a general IT process.

## Examine the Ansible Playbook

This exercise has provided an already complete Ansible Playbook.  To examine this playbook use the Linux `cat` command to examine the `apache.yml` file:

`cat apache.yml`{{execute}}

The play looks like this:

```
---
- name: Apache server installed
  hosts: web
  gather_facts: false
  become: yes
  tasks:
```

  - `---` - indicates file is in YAML format
  - `hosts` - this play will be executed on the group `web`
  - `gather_facts` - for this exercise we are not using Ansible facts, so we turned off fact gathering
  - `become` - this play will use all tasks in privileged mode
  - `tasks` - the tasks are outlined as follows:

     1. Install httpd package

     2. Enable/start httpd service

     3. Copy over an index.html file to each web host

     4. Open up https web traffic on firewalld


We will examine each of these tasks in the following steps.  

First, execute the Ansible Playbook.

## Execute the Ansible Playbook

Use the `ansible-playbook` command to execute the playbook `apache.yml`:

`ansible-playbook apache.yml`{{execute}}

The Ansible Playbook will execute the three tasks on the two Red Hat Linux Enterprise web servers host02 and host03.
