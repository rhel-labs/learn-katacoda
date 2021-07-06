# Using `free` to view information about the system memory usage

Processes require memory to run, so when the system is running low on free
memory it can slow down significantly. The `free` command is useful for quickly
getting a summary of memory usage.

`free -h`{{execute}}

The `-h` option outputs the information in a human-readable format.

If the available memory is very low, the fourth column of `ps au` can be
used for finding which processes are the culprits. To sort the output by
memory usage, add the `--sort=-%mem` option:

`ps au --sort=-%mem`{{execute}}

The first entry on this sorted list belongs to `top` from the previous step.
Suppose you no longer needed `top` and wanted to free up the resources being
used by this process. One option would be to return to terminal that it is
running in and quit it. However, it is simpler in most cases to use the `kill`
command. The process ID shown in the `ps` output is how you refer to the process
when killing it.

<pre class=file>
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root       15848  0.0  0.2  27012  4732 pts/1    Ss+  21:05   0:00 -bash
root        2631  0.0  0.2  27012  4712 pts/0    Ss   20:54   0:00 -bash
root       15873  0.0  0.2  61648  3948 pts/0    R+   21:06   0:00 ps -au --sort=-%mem
root         913  0.0  0.0  13656  1632 tty1     Ss+  16:54   0:00 /sbin/agetty -o -p -- \u --noclear tty1 linux
</pre>

More information on process managment can be found in the [Service Admin Basics lab](https://lab.redhat.com/service-admin).
