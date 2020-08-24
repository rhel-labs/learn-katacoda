# Exploring and understanding the lab environment

>**Note:** For this scenario, we have started installing ansible and performing an yum update to 8.2 in the background. The background task will take between 2-5 minutes to complete. 

In this lab environment, we have provisioned 3 nodes as shown below -

| Role                 | Inventory name | IP Address     |
| ---------------------| ---------------| ---------------|
| Ansible Control node | host01         | `[[HOST1_IP]]` |
| Managed host 2       | host02         | `[[HOST2_IP]]` |
| Managed host 3       | host03         | `[[HOST3_IP]]` |

A control node is any machine with ansible installed. All three nodes are running Red Hat Enterprise Linux 8.0. We will be using *host02*
to deploy the IdM server, and *host03* to deploy the IdM client. 

> __NOTE__ : In production, IdM replicas are typically deployed for scale and high-availability reasons. However, in this lab, we will only
be deploying a single instance of the IdM server.

# Yum update all hosts using ansible 

First, update all the servers to the latest available RHEL using ansible. For this, the playbook file (*playbook-upgrade.yml*) uses the ansible 
*yum* module. The hosts are picked up from the hosts file (*/root/hosts*), and the default host group comprises of all the hosts.

`ansible-playbook playbook-upgrade.yml`{{execute T1}}

> __NOTE__ : This step could take a few minutes to complete.

After ansible completes this task, you can take a look at the redhat-release version - 

`cat /etc/redhat-release`{{execute T1}}

# Install IdM roles on the control node

For this lab we will be using ansible roles to simplify and automate deployment of IdM.  Download and install the IdM ansible roles -

`yum install -y ansible-freeipa`{{execute T1}}

The roles will be installed in the */usr/share/ansible/roles* directory.

Take a look at the roles that are now available to use 

`ls -l /usr/share/ansible/roles`{{execute T1}}

