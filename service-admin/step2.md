# Viewing the status of a service

__firewalld__ is a service which manages what network traffic to let into the system.
Many system administrators need to manually configure which ports or services are
allowed to communicate through the firewall, which means that many people will
find themselves interacting with the __firewalld__ service at some point.
Check the status of the __firewalld__ service with the following command:

`systemctl status firewalld.service | cat`{{execute}}

<pre class=file>
● firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; enabled; vendor preset: enabled)
   Active: active (running) since Mon 2021-06-28 15:50:21 EDT; 1h 49min ago
     Docs: man:firewalld(1)
 Main PID: 875 (firewalld)
    Tasks: 2 (limit: 11380)
   Memory: 35.3M
   CGroup: /system.slice/firewalld.service
           └─875 /usr/libexec/platform-python -s /usr/sbin/firewalld --nofork --nopid

<< OUTPUT ABRIDGED >>
</pre>

>_NOTE:_ This output is piped to `cat` to avoid entering a shell for the status
command. When running this on your own, you do not need to pipe the output
to `cat`.

From this status message it is clear that the __firewalld__ service is installed
and active. You will use this service for examples throughout this lab.
