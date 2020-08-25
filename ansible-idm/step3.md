# Install the IPA Server software

The FreeIPA server provides centralized authentication, authorization and account information by storing data about user, groups, hosts and other objects necessary to manage the security aspects of a network of computers. 

To install the FreeIPA server using ansible on *host02* - 

`ansible-playbook -v -i ~/hosts ansible-freeipa/playbooks/install-server.yml`{{execute}}

The target host (*host02*) and other IPA server variables are picked up from the ansible inventory file (*/root/hosts*).

# Configure the DNS name resolution 

On most Linux operating systems, the DNS servers that the system uses for name resolution are defined in the */etc/resolv.conf* file.

Retrieve the IP address of *host02* and store it in the IP environment variable - 

`IP=$(hostname -i | awk '{print $NF}')`{{execute T3}}

Set the DNS nameserver to point to the IP address of the IPA server in the */etc/resolv.conf* file 

`sed -i '2i nameserver '``echo $IP`` /etc/resolv.conf`{{execute T3}}

Inspect the */etc/resolv.conf* file 

`cat /etc/resolv.conf`{{execute T3}}

# Start and stop the IPA Server 
