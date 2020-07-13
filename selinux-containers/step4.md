# Re-inspect the running container

In terminal 2, exec into the running container and start a bash shell 
`podman exec -t -i $CONTAINER /bin/bash`{{execute T2}}

Check whether container has access to the home directory
`cd /home/; ls`{{execute T2}}

<pre class="file">
packer  rhel
</pre>

Check whether container has read access to the /var/spool/ directory
`cd /var/spool/; ls`{{execute T2}}

<pre class="file">
anacron  cron  lpd  mail  plymouth  rhsm  up2date
</pre>

Check whether container has write access to the /var/spool/ directory
`touch test; ls`{{execute T2}}
<pre class="file">
anacron  cron  lpd  mail  plymouth  rhsm  test  up2date
</pre>

Install the nc package inside the container
`yum install -y nc`{{execute T2}}

Proof that SELinux allows binding to tcp/udp 80 port
`nc -lvp 80`{{execute T2}}

<pre class="file">
Ncat: Version 7.70 ( https://nmap.org/ncat )
Ncat: Listening on :::80
Ncat: Listening on 0.0.0.0:80
Ncat: Connection from 172.17.0.3.
Ncat: Connection from 172.17.0.3:38864.
HEAD / HTTP/1.1
Host: 2886795318-80-elsy03.environments.katacoda.com
User-Agent: Go-http-client/1.1
</pre>

Proof that SELinux blocks binding to tcp/udp 8080 port
`nc -lvp 8080`{{execute T2}}

<pre class="file">
Ncat: Version 7.70 ( https://nmap.org/ncat )
Ncat: bind to :::8080: Permission denied. QUITTING.
</pre>
