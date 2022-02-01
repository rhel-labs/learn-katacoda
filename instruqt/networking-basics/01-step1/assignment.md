---
slug: step1
id: 1c2qyydryxiw
type: challenge
title: Step 1
notes:
- type: text
  contents: |
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
tabs:
- title: Host 1
  type: terminal
  hostname: host1
- title: Host 2
  type: terminal
  hostname: host2
difficulty: basic
timelimit: 200
---
# What is NetworkManager?

NetworkManager is a great tool for creating and modifying network connections.
The `nmcli` command is how you will be running NetworkManager in this lab. Any changes
made with `nmcli` are persistent configuration file changes. This lab will give you an
overview of some of the most common operations you would run using this tool.

# Listing network devices

Before you can set up a connection, you have to know what hardware
is available for you to use. To show what network devices this system has with
`nmcli`, run

```
nmcli device
```

>_NOTE:_ You may need to wait a few seconds and retry the command above if the terminal for __host01__ is still loading.

This will show a list of network interfaces available on the system as well as
how they are configured, similar to the following:

<pre class=file>
DEVICE  TYPE      STATE                                  CONNECTION
ens3    ethernet  connected                              System ens3
ens5    ethernet  connecting (getting IP configuration)  Wired connection 1
lo      loopback  unmanaged                              --
</pre>

This output shows that there are three devices: __ens3__ and __ens5__ (ethernet devices)
as well as __lo__ (the loopback device).

Next, you will make your own connection on this host.
