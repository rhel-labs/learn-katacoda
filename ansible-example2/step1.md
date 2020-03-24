# Ansible Playbook Overview

Playbooks are Ansible’s configuration, deployment, and orchestration language. They can describe a policy you want your remote systems to enforce, or a set of steps in a general IT process.

## Examine the Ansible Playbook

This exercise has provided an already complete Ansible Playbook.  To examine this playbook use the Linux `cat` command

`cat apache.yml`{{execute}}

This Ansible Playbook has three tasks:

  - First step: Install httpd package

  - Second step: Enable/start httpd service

  - Third step: Copy over an index.html file to each web host
