---
slug: step5
id: i8mwfd7dhxuv
type: challenge
title: Step 5
tabs:
- title: Terminal
  type: terminal
  hostname: rhel
- title: RHEL Web Console
  type: service
  hostname: rhel
  path: /
  port: 9090
difficulty: basic
timelimit: 300
---
# Recording a session

Create a shell as the __rhel__ user so that the session can be recorded.
Recall that the __rhel__ user's password is __redhat__.

```
ssh rhel@localhost
```

You will notice that when the `ssh` session starts, the __rhel__ user receives
the notice message configured in the __tlog__ configuration.

<pre class=file>
rhel@localhost's password: <b>redhat</b>

ATTENTION! Your session is being recorded!

[rhel@somehost ~]$
</pre>

Run some commands in the __rhel__ user's session.

```
ls /tmp
```

```
who
```

```
df -hP
```

```
yum list installed
```

Now that you have some data in a recorded session, you can log out of the
user's `ssh` session.
```
exit
```

