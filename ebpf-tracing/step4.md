In this demo we've seen usage of few sample tools created with eBPF.
There are many other tools provided by the bcc-tools package which provide
various useful data and statistics.

`ls -l /usr/share/bcc/tools | wc -l`{{execute T1}}

<pre class="file">
# ls -l /usr/share/bcc/tools | wc -l
101
</pre>

The tools can be easily inspected or even modified since these tools are actually Python scripts:

`file /usr/share/bcc/tools/biolatency`{{execute T1}}

<pre class="file">
$ file /usr/share/bcc/tools/biolatency
/usr/share/bcc/tools/biolatency: Python script, ASCII text executable
</pre>

This is not entirely true. Each of the tools shipped in the bcc-tools package
contains a portion written in C language which is the code of the eBPF
program which, after compilation, is passed to the kernel via bpf() syscall and
used for collection and analysis of the data. The Python script then reads
output of this eBPF program and allows easy formating or further processing.
