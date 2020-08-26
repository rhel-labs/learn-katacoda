# Install the IdM Server software

FreeIPA server provides centralized authentication, authorization and account information by storing data about user, groups, hosts and other objects necessary to manage the security aspects of a network of computers. 

To install FreeIPA server using ansible on *host02*, run the *ansible-playbook* command on the control node - 

`ansible-playbook -vv -i ~/hosts ansible-freeipa/playbooks/install-server.yml`{{execute T1}}

> __NOTE__ : In this step, we have only installed a single IdM server. However, in production, IdM replicas are typically deployed for scale and high-availability reasons. An IdM replica server is a full read/write copy of the first installation, and can be easily created using the *ipa-replica-prepare* command. 

The target host (*host02*) and other IPA server variables are picked up from the ansible inventory file (*/root/hosts*).

A number of different services are installed together with an IdM server, including Directory Server, Certificate Authority (CA), DNS, Kerberos, and others. The *--vv* option adjusts the verbosity level of the output so that you can get a deeper understanding of what the ansible task is doing.

# Configure the DNS name resolution 

On most Linux operating systems, the DNS servers that the system uses for name resolution are defined in the */etc/resolv.conf* file.

In the *host02* terminal window of the lab, retrieve the IP address and store it in an environment variable (called *IP*) - 

`IP=$(hostname -i | awk '{print $NF}')`{{execute T3}}

Using the *host02* terminal of the lab, SSH into the IPA client node (*host03*) and set the DNS nameserver to point to the IPA server in the */etc/resolv.conf* DNS file -

> __NOTE__ : The root password of the *host03* node is **katacoda** 

`ssh host03.test.local \"sed -i '2i nameserver $IP' /etc/resolv.conf\"`{{execute T3}}

In the *host03* terminal of the lab, inspect the */etc/resolv.conf* file on *host03* to ensure that there is a nameserver entry with the IdM server's IP.

`cat /etc/resolv.conf`{{execute T4}}

# Stop and start the IPA Server 

Because IdM has several different services working together, *ipactl* is a single utility to stop, start, or restart the entire IdM server along with all other installed services.

Using the *host02* terminal of the lab, stop the IdM server and all installed services -

`ipactl stop`{{execute T3}}

Using the *host02* terminal of the lab, start the entire IdM server and all installed services -

`ipactl start`{{execute T3}}

If you only want to stop, start, or restart an individual IdM service, use the *systemctl* utility.
