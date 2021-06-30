# Starting and enabling a service with `systemctl`

`showmount -e`{{execute T1}}

This will throw an error, because the service is not running.

<pre class=file>
clnt_create: RPC: Program not registered
</pre>

To solve this issue, you would start the service. However, if you want the service
to start each time you boot the system, you would want to enable the service. You can
do both of these operations in one line:

`systemctl enable --now nfs-server`{{execute T1}}

<pre class=file>
Created symlink /etc/systemd/system/multi-user.target.wants/nfs-server.service → /usr/lib/systemd/system/nfs-server.service
</pre>

>_Note:_ If you just wanted to start a service, `systemctl start`
followed by the service name will do the trick. However, the service
will not start again if you reboot the system. 


Now the __nfs-server__ service is started, and it will start every time the
system starts as well. Run the `showmount` command again now that the service
is active:

`showmount -e`{{execute T1}}

<pre class=file>
Export list for b02029791f2d:
</pre>

The export list is currently blank, which is something controlled by a
configuration file. You may assume that changing a config file would
immediately lead to changes in the service, but this is not the case.
The next step will walk you through restarting a service to reload configuration
files.
