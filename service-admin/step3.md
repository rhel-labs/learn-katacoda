# What is a service?

# Viewing the status of a service

__firewalld__ is a service which manages what network traffic to let into the system.
Check the status of the __firewalld__ service with the following command:

`systemctl status firewalld.service --no-pager`{{execute T1}}

<pre class=file>
● firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; enabled; vendor preset: enabled)
   Active: active (running) since Mon 2021-06-28 15:50:21 EDT; 1h 49min ago
     Docs: man:firewalld(1)
 Main PID: 875 (firewalld)
    Tasks: 2 (limit: 11380)
   Memory: 35.3M

<< OUTPUT ABRIDGED >>
</pre>

From this status message it is clear that the __firewalld__ service is installed
and active. But what is managing this service? It turns out that another service,
__systemd__, is in charge of managing all of the services on the system.

# __systemd__ vs. __systemctl__

When researching service management, you will come across two very similar terms:
__systemd__ and __systemctl__. These are very closely related.
__systemd__, short for system daemon, manages the state of the system and any
services running on it. Since __systemd__ is a daemon, it runs in the background
and needs a set of commands for users to interact with it. __systemctl__ provides
these commands. The `systemctl status` command above is one example of this,
and the upcoming steps will walk you through starting and enabling a service
with __systemctl__.
