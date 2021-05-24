# Overview:

NetworkManager is a great tool for creating and modifying networks. This lab
will walk you through creating your own network connection from scratch and
modifying key parameters to control how that network connection behaves.

You will use two terminal tabs: `node01` and `node02`. You will carry out the
connection configuration on `node01`, and then at the end you will switch to
`node02` to test that the connection was successfully setup.

# Goal:

After completing this scenario, users will be able to configure the IP, hostname,
and DNS for a connection using `nmcli`.

# Concepts included in this scenario:
* Introduction to NetworkManager (`nmcli`)
* Configuring a new connection with a dynamic IP using DHCP
* Modifying this connection to have a static IP
* Viewing and configuring a DNS server and hostname
