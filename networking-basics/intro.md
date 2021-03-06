# Overview:

NetworkManager is a great tool for creating and modifying networks. This lab
will walk you through creating your own network connection from scratch and
modifying key parameters to control how that network connection behaves.

You will use two terminal tabs: `host01` and `host02`. You will carry out the
connection configuration on `host01`, and then at the end you will switch to
`host02` to test that the connection was successfully set up.

# Goal:

After completing this scenario, users will be able to configure the IP, hostname,
and DNS for a connection using `nmcli`.

# Concepts included in this scenario:
* Learn NetworkManager (`nmcli`) syntax
* Configure a new dynamic IP connection using DHCP
* Update this connection to use static IP address assignment
* Validate and configure DNS server settings
