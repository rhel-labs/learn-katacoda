# Recording a session

Create a shell as the __rhel__ user so that the session can be recorded.
Recall that the __rhel__ user's password is __redhat__.

`ssh rhel@localhost`{{execute}}

You will notice that when the `ssh` session starts, the __rhel__ user receives
the notice message configured in the __tlog__ configuration.

<pre class=file>
rhel@localhost's password: <b>redhat</b>

ATTENTION! Your session is being recorded!

[rhel@somehost ~]$
</pre>

Run some commands in the __rhel__ user's session.  

`ls /tmp`{{execute}}   
   
`who`{{execute}}   
   
`df -hP`{{execute}}   
   
`yum list installed`{{execute}}

Now that you have some data in a recorded session, you can log out of the
user's `ssh` session.  
`exit`{{execute}}

