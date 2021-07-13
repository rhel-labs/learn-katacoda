# Viewing processes

`ps`{{execute}}

>_NOTE:_ For more info on using `ps` (including how to end processes), check
out the [Service Administration Basics lab](https://lab.redhat.com/service-admin)

The output of this command is often very lengthy, so this is a great chance
to apply what you just learned in the previous step. Using the pipe operator (`|`),
pipe the output of `ps aux` into the `grep` command to search for a specific
process:

`ps aux | grep `{{execute T1}}

`ps` is great for showing a snapshot of the active processes and their
resource usage, but sometimes it is more useful to have a utility that keeps
updating this information in real time. `top` does just that.


`top`{{execute T2}}

<pre class=file>
top - 21:11:07 up  4:10,  2 users,  load average: 0.45, 0.16, 0.06
Tasks: 114 total,   1 running, 113 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.3 sy,  0.0 ni, 99.3 id,  0.2 wa,  0.2 hi,  0.0 si,  0.0 st
MiB Mem :   1817.0 total,   1135.0 free,    181.5 used,    500.5 buff/cache
MiB Swap:   4000.0 total,   4000.0 free,      0.0 used.   1482.2 avail Mem

  PID USER    PR  NI   VIRT   RES   SHR S %CPU %MEM    TIME+ COMMAND
 2940 root    20  0       0     0     0 I  0.3  0.0  0:00.01 kworker/u4:2-flush-253:0
15893 root    20  0   65416  4736  3952 R  0.3  0.3  0:00.04 top
    1 root    20  0  187008  4968  9800 S  0.0  0.8  0:03.06 systemd
    2 root    20  0       0     0     0 S  0.0  0.0  0:00.01 kthreadd
    3 root     0 -20      0     0     0 I  0.0  0.0  0:00.00 rcu_gp
</pre>

This output will continue updating until you quit `top`, making it particularly
useful for diagnosing issues that change over time. Leave `top` running in this
terminal for now, you will return to it later.
