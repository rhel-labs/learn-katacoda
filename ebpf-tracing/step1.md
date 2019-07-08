Install bcc-tools

`yum install -y bcc-tools kernel-devel-4.18.0-80.el8`{{execute}}

eBPF is a modern mechanism which allows instrumenting of kernel in secure
restrictred environment without loading kernel modules. Technicaly eBPF is
accessible via new syscall bpf(). The code of the eBPF program needs to be
passed to the kernel via this syscall in the form of BPF assembly code.
Fortunately bcc-tools package provide many useful pre-created tools created using eBPF.

Inspect the content of the bcc-tools package:

`rpm -ql bcc-tools | grep /usr/share/bcc/tools/`{{execute}}

All the pre-created tools are delivered under /usr/src/bcc/tools:

<pre class="file">
$ rpm -ql bcc-tools
...
/usr/share/bcc/tools/argdist
/usr/share/bcc/tools/bashreadline
/usr/share/bcc/tools/biolatency
/usr/share/bcc/tools/biosnoop
...
</pre>
