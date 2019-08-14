# Installing software

When you start this demo, SQL Server installation will start on the machine. 
You should see the message like the one below as a confirmation that the installation 
is complete.

<pre class="file">
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
Microsoft SQL Server 2017 (RTM-CU16) (KB4508218) - 14.0.3223.3 (X64)
        Jul 12 2019 17:43:08
        Copyright (C) 2017 Microsoft Corporation
        Enterprise Evaluation Edition (64-bit) on Linux (Red Hat Enterprise Linux 8.0 (Ootpa))

(1 rows affected)
</pre>

Install two rpm packages, __cockpit-session-recording__ and __tlog__.

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


