# Installing software

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


