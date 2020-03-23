# Examine Ansible software version

Run the ansible command with the --version flag to see not only the version of Ansible that's installed, but also a few other key details:

`ansible --version`{{execute}}

Take note of the config file
```
config file = /root/ansible.cfg
```

# Intro to Ad-Hoc commands

We are going to run some ad-hoc commands to help you get a feel for how Ansible works.  Ansible Ad-Hoc commands enable you to perform tasks on remote nodes without having to write a playbook.  

Use the `ansible` command and provide the group you want to execute on.  Try using the `--list-hosts` command:  

`ansible web --list-hosts`{{execute}}`

now compare this to

`ansible all --list-hosts`{{execute}}

You will notice that the group web only contains *host02* and *host03* whereas all also contains *host01*

# Determining	connectivity

We can also use modules to perform ad-hoc tasks.  The most common example is using the [ping module](https://docs.ansible.com/ansible/latest/modules/ping_module.html) to determine connectivity from the control node to managed hosts.

The `-m` option defines which Ansible module to use

`ansible web -m ping`{{execute}}
