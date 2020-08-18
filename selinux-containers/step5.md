# Re-inspect the running container

In *Terminal 2* of the lab interface, exec into the running container and start a bash shell 

`podman exec -t -i $CONTAINER /bin/bash`{{execute T2}}

Check whether container has access to the */home* directory

`cd /home/; ls`{{execute T2}}

<pre class="file">
packer  rhel
</pre>

This is now successful since there is an allow rule in place that tells SELinux to allow this action.

Check whether container has read access to the */var/spool/* directory

`cd /var/spool/; ls`{{execute T2}}

<pre class="file">
anacron  cron  lpd  mail  plymouth  rhsm  up2date
</pre>

Similarly, this is also successful because there is an allow rule in place that tells SELinux to allow this action.

Check whether container has write access to the /var/spool/ directory

`touch test; ls`{{execute T2}}

<pre class="file">
anacron  cron  lpd  mail  plymouth  rhsm  test  up2date
</pre>
 
Install the netcat (nc) package inside the container to test for port bindings

`yum install -y nc`{{execute T2}}

Tell nc to listen on port 80 inside the container, and timeout after 5 seconds.

`timeout 5s nc -lvvp 80`{{execute T2}}

<pre class="file">
Ncat: Version 7.70 ( https://nmap.org/ncat )
Ncat: Listening on :::80
Ncat: Listening on 0.0.0.0:80
</pre>

You can see from the above output that netcat was able to connect and listen on port 80. This is successful 
because there is a allow rule in place that tells SELinux to allow this network action on port 80.

Tell nc to listen on port 8080 inside the container, and timeout after 5 seconds.

`timeout 5s nc -lvvp 8080`{{execute T2}}

<pre class="file">
Ncat: Version 7.70 ( https://nmap.org/ncat )
Ncat: bind to :::8080: Permission denied. QUITTING.
</pre>

You can see from the above output that netcat was NOT able to connect and listen on port 8080. There is no allow 
rule in place that tells SELinux to allow this operation, and hence it was blocked by SELinux.
