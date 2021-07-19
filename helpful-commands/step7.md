# Using `free` to view information about the system memory usage

Processes require memory to run, so when the system is running low on free
memory it can slow down significantly. The `free` command is useful for quickly
getting a summary of memory usage.

`free -h`{{execute T1}}

The `-h` option outputs the information in a human-readable format.

<pre class=file>
           total       used      free    shared   buff/cache  available
Mem:       1.8Gi       156Mi     1.2Gi   16Mi     430Mi       1.5Gi
Swap:      3.9Gi       0B        3.9Gi
</pre>

If the available memory is very low, the fourth column of `ps au` can be
used for finding which processes are the culprits. To sort the output by
memory usage, add the `--sort=-%mem` option:

`ps au --sort=-%mem`{{execute T1}}

<pre class=file>
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root        1935  0.5  0.2  65416  4704 pts/1    S+   15:05   0:00 top
root        1914  0.1  0.2  27012  4652 pts/1    Ss   15:05   0:00 -bash
<< OUTPUT ABRIDGED >>
</pre>

The first entry on this sorted list belongs to `top` from the previous step.
Suppose you no longer needed `top` and wanted to free up the resources being
used by this process. One option would be to return to terminal that it is
running in and quit it. However, it is simpler in most cases to use the `kill`
command. The process ID shown in the `ps` output is how you refer to the process
when killing it. Kill the `top` process from this terminal:

`kill $(pidof top)`{{execute T1}}

This does not show any output, but returning to Terminal 3 reveals that `top`
is no longer updating.

If you want more exercises on this topic, more information on process managment
can be found in the [Service Admin Basics lab](https://lab.redhat.com/service-admin).
