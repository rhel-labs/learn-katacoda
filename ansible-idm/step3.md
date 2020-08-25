# Install the IPA Server software

A FreeIPA server provides centralized authentication, authorization and account information by storing data about user, groups, hosts and other objects necessary to manage the security aspects of a network of computers. 

To install the FreeIPA server using ansible on *host02* - 

`ansible-playbook -v -i ~/hosts ansible-freeipa/playbooks/install-server.yml`{{execute}}

# Configure the DNS name resolution 

On most Linux operating systems, the DNS servers that the system uses for name resolution are defined in the */etc/resolv.conf* file.

Retrieve the IP address of *host02* - 

`IP=$(hostname -i | awk '{print $NF}')`{{execute T3}}

Set the DNS to point to the IPA server 

`sed -i '2i nameserver '`echo $A` /etc/resolv.conf`{{execute T3}}

Inspect the */etc/resolv.conf* file 

`cat /etc/resolv.conf`{{execute T3}}

# Install the IPA client software

Similarly, install the FreeIPA client using ansible on *host03* -

`ansible-playbook -v -i ~/hosts ansible-freeipa/playbooks/install-client.yml`{{execute}}

There are several server and client playbook variables that need to be set in the */root/hosts* inventory file. 
