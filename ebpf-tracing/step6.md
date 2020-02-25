In this demo, we've now observed host name resolution, tcp connection information, file activity in real time, filesystem latency, and realtime hits and misses on the memory cache in Red Hat Enterprise Linux. Tools utilizing eBPF, such as those shipped with bcc-tools in Red Hat Enterprise Linux, are very powerful and allow us quick access to information about the kernel and our systems.

Let's take a look at how many tools are provided by bcc-tools:

`ls -l /usr/share/bcc/tools | wc -l`{{execute T1}}

<pre class="file">
# ls -l /usr/share/bcc/tools | wc -l
101
</pre>

These tools can be easily inspected or even modified since they are actually Python scripts:

`file /usr/share/bcc/tools/biolatency`{{execute T1}}

<pre class="file">
$ file /usr/share/bcc/tools/biolatency
/usr/share/bcc/tools/biolatency: Python script, ASCII text executable
</pre>

Each of the tools shipped in the bcc-tools package contains a portion written in C language which is the code of the eBPF program which, after compilation, is passed to the kernel via bpf() syscall and used for collection and analysis of the data. The Python script then reads output of this eBPF program and allows easy formating or further processing.
