# What is NetworkManager?

NetworkManager is a great tool for creating and modifying network connections.
The `nmcli` command is how we will be running NetworkManager in this lab. Any changes
made with ‘nmcli’ are persistent configuration file changes. This lab will give you an
overview of some of the most common operations you would run using this tool.

# Listing network devices

Let’s take a look at what network hardware this system has.
To do this with `nmcli`, run

`nmcli device`{{execute "host01"}}

This will show a list of network interfaces available on the system as well as
how they are configured, similar to the following:

<pre class=file>
DEVICE  TYPE      STATE                                  CONNECTION         
ens3    ethernet  connected                              System ens3        
ens5    ethernet  connecting (getting IP configuration)  Wired connection 1
lo      loopback  unmanaged                              --      
</pre>

This output shows that there are three devices: ethernet slot 3, ethernet slot 5,
and loopback.

# Listing network connections

Now let's take a look at the configured connections on this host:

`nmcli con`{{execute "host01"}}

<pre class=file>
NAME                UUID                                  TYPE      DEVICE
Wired connection 1  8d94cceb-4b2d-3a0c-b9b2-6dedf34944a0  ethernet  ens5   
System ens3         bbc9283d-5063-4e79-8f57-8c6eda5618c3  ethernet  ens3
</file>

This gives similar information to the output of `nmcli device`, just sorted
differently. Now we can move on to making our own connection on this node. 
