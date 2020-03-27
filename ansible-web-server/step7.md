# Understanding idempotency

A Playbook should be **idempotent**, so if a playbook is run once to put the hosts in the correct state, it should be safe to run it a second time and it should make no further changes to the hosts.

To validate the concept of idempotency, re-run the playbook exactly like you did in step 2.  Use the `ansible-playbook` command to execute the playbook `apache.yml`:

`ansible-playbook apache.yml`{{execute}}

The Ansible Playbook will execute the three tasks on the two Red Hat Linux Enterprise web servers `host02` and `host03`.

However this time all three tasks will say **<font color="green">ok</font>** versus **changed**.  Re-running the Ansible Playbook multiple times will result in the same exact output, with **ok=4** and **change=0**.  

Unless another operator or process removes or modifies the existing configuration on rtr1, this Ansible Playbook will just keep reporting **ok=4**  in the **PLAY RECAP** indicating that the application is installed, started, enabled and the configuration already exists on the web server device.  

Try re-running the Ansible Playbook again ti illustrate this concept again:

`ansible-playbook apache.yml`{{execute}}

# Verify the web server is setup

To access the webserver on `host02`, visit:
https://[[HOST2_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com

To access the webserver on `host03`, visit:
https://[[HOST3_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com
