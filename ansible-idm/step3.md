# Install the IdM Server software

In this lab, we will be using FreeIPA which is an upstream open-source project for Red Hat Identity Manager (IdM).

FreeIPA server provides centralized authentication, authorization and account information by storing data about user, groups, hosts and other objects necessary to manage the security aspects of a network of computers. 

To install FreeIPA server using ansible on *host02* - 

`ansible-playbook -v -i ~/hosts ansible-freeipa/playbooks/install-server.yml`{{execute}}

The target host (*host02*) and other IPA server variables are picked up from the ansible inventory file (*/root/hosts*).

A number of different services are installed together with an IdM server, including Directory Server, Certificate Authority (CA), DNS, Kerberos, and others.

> __NOTE__ : In this lab, we have just installed a single IdM server. However, in production, no one wants just one IdM server. An IdM replica server (which is a full read/write copy of the first installation) can be easily created using the *ipa-replica-prepare* command. 

# Configure the DNS name resolution 

On most Linux operating systems, the DNS servers that the system uses for name resolution are defined in the */etc/resolv.conf* file.

Retrieve the IP address of *host02* and store it in the IP environment variable - 

`IP=$(hostname -i | awk '{print $NF}')`{{execute T3}}

Set the DNS nameserver to point to the IP address of the IPA server in the */etc/resolv.conf* file 

`sed -i '2i nameserver '``echo $IP`` /etc/resolv.conf`{{execute T3}}

Inspect the */etc/resolv.conf* file 

`cat /etc/resolv.conf`{{execute T3}}

# Stop and start the IPA Server 

Because IdM has several different services working together, *ipactl* is a single utility to stop, start, or restart the entire IdM server along with all other installed services.

To stop the IdM server and all installed services -

`ipactl stop`{{execute T3}}

To start the entire IdM server and all installed services -

`ipactl start`{{execute T3}}

If you only want to stop, start, or restart an individual IdM service, use the *systemctl* utility.
