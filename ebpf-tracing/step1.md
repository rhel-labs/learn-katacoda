Install bcc-tools

`yum install -y bcc-tools kernel-devel-$(uname -r)`{{execute T1}}

eBPF is an in-kernel virtual machine that allows code execution in the kernel space, in a restricted sandbox environment with access to a limited set of functions. The virtual machine executes special assembly-like code. The code is then loaded in the kernel and translated to the native machine code with just-in-time compilation. There are numerous components shipped by Red Hat that utilize the eBPF virtual machine. 

Fortunately, the bcc-tools package provide many pre-created tools that provide useful functions built with eBPF.

Let's inspect the content of the bcc-tools package:

`rpm -ql bcc-tools | grep /usr/share/bcc/tools/`{{execute T1}}

All the pre-created tools are delivered under /usr/share/bcc/tools:

<pre class="file">
$ rpm -ql bcc-tools
...
/usr/share/bcc/tools/argdist
/usr/share/bcc/tools/bashreadline
/usr/share/bcc/tools/biolatency
/usr/share/bcc/tools/biosnoop
...
</pre>
