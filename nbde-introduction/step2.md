# Examine Ansible software version

Run the ansible command with the --version flag to see not only the version of Ansible that's installed, but also a few other key details:

`ansible --version`{{execute}}

The output will look similar to the following:

```
[root@c01c899604a3 ~]# ansible --version
ansible 2.9.6
  config file = /root/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.6/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.6.8 (default, Jan 11 2019, 02:17:16) [GCC 8.2.1 20180905 (Red Hat 8.2.1-3)]
```

Take note of the config file
```
config file = /root/ansible.cfg
```

We always know from our current working directory which Ansible Configuration file we are using and in turn, which inventory we are using.

# Intro to ad-hoc commands

We are going to run some ad-hoc commands to help you get a feel for how Ansible works.  Ansible Ad-Hoc commands enable you to perform tasks on remote nodes without having to write a playbook.  

Use the `ansible` command and provide the group you want to execute on.  Try using the `--list-hosts` command:  

`ansible web --list-hosts`{{execute}}`

The output will look like this:

```
  hosts (2):
    host02
    host03
```

now compare this to

`ansible all --list-hosts`{{execute}}

The output will look like this:

```
  hosts (3):
    host01
    host02
    host03
```

You will notice that the group web only contains `host02` and `host03` whereas all also contains `host01`

# Determining	connectivity

We can also use modules to perform ad-hoc tasks.  The most common example is using the [ping module](https://docs.ansible.com/ansible/latest/modules/ping_module.html) to determine connectivity from the control node to managed hosts.

The `-m` option defines which Ansible module to use

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
