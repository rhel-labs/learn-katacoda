In this lab, you have now observed: host name resolution, tcp connection information, file activity (in real time), filesystem latency, and realtime hits and misses on the memory cache on a Red Hat Enterprise Linux 8 system. Tools utilizing eBPF, such as those shipped with bcc-tools in Red Hat Enterprise Linux 8, are very powerful and allow you quick access to information about the kernel and your systems.

Take a look at how many tools are provided by bcc-tools:

`ls -l /usr/share/bcc/tools | wc -l`{{execute T1}}

<pre class="file">
107
</pre>

The 107 tools, counted in the example above, can be easily inspected or even modified since they are actually Python scripts:

`file /usr/share/bcc/tools/biolatency`{{execute T1}}

<pre class="file">
/usr/share/bcc/tools/biolatency: Python script, ASCII text executable
</pre>

Each of the tools shipped in the bcc-tools package contains a portion written in C language which is the code of the eBPF program which, after compilation, is passed to the kernel via the bpf() system call and used for collection and analysis of the data. The Python script then reads output of this eBPF program and allows easy formating or further processing.
