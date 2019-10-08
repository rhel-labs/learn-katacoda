# Installing software

When you start this demo, SQL Server installation will start on the machine. 

First, verify that SQL Server is running on the machine.

`systemctl status mssql-server.service --no-pager`{{execute T1}}

On the terminal, you should see something like below indicating that the mssql-server.service is running

<pre class="file">
<< OUTPUT ABRIDGED >>

Active: active (running) since Monday 2019-07-15 19:24:18 EDT; 3h 59min left

<< OUTPUT ABRIDGED >>
</pre>


Next, install two rpm packages, __cockpit-session-recording__ and __tlog__ for the web console

`yum -y install cockpit-session-recording tlog`{{execute}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Installed:
  cockpit-session-recording-1-29.el8.noarch                      tlog-5-1.el8.x86_64

Complete!
</pre>

The first package, __cockpit-session-recording__ will add an additional feature
Web Console which you will be using to enable and configure session recording.
The __tlog__ package will provide the tools which will be used to both record 
and view the recorded terminal sessions.


