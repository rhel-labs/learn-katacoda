Read a man page of the first of the tools:

`man killsnoop`{{execute}}

Use key 'q' to exit manpage.
Run the killsnoop tool without any arguments:

`/usr/share/bcc/tools/killsnoop`{{execute T1}}

Now lets open a new terminal and in this new terminal send couple of signals:

`kill $$`{{execute T2}}
`kill $$`{{execute T2}}
`kill -2 $$`{{execute T2}}
`kill -2 $$`{{execute T2}}

Note that $$ is the pid of current process, thus we are sending signals 15 and 2 to our current shell.
Go back to the first terminal and verify this was reported by the killsnoop tool:

<pre class="file">
# /usr/share/bcc/tools/killsnoop
TIME      PID    COMM             SIG  TPID   RESULT
15:49:37  8405   bash             15   8405   0
15:49:37  8405   bash             15   8405   0
15:49:38  8405   bash             2    8405   0
15:49:39  8405   bash             2    8405   0
</pre>

Exit the killsnoop tool by pressing CTRL+C in the terminal:

eBPF allows access to all kernel data including syscalls (and their arguments) executed by all processes.
