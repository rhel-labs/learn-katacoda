eBPF is an in-kernel virtual machine that allows code execution in the 
kernel space, in a restricted sandbox environment with access to a limited 
set of functions. The virtual machine executes special assembly-like code. 
The code is then loaded in the kernel and translated to the native machine 
code with just-in-time compilation. There are numerous components shipped 
by Red Hat that utilize the eBPF virtual machine. 

The bcc-tools package provides many pre-created tools that provide data from 
functions built with eBPF.

First, install the kernel-devel package for your currently running kernel
and the bcc-tools packages.  

`yum install -y kernel-devel-$(uname -r) bcc-tools`{{execute T1}}

>**Note:** In the command above, we embed the `uname -r` command to 
automatically determine, and embed, the version of the currently running kernel.


Next, inspect the content of the bcc-tools package to see some of the
pre-built tool catalog that is provided.  Each of these tools has a
`man` page which provides details on what data the tool produces as well
as any options that may be used when running the tool.

`rpm -ql bcc-tools | grep /usr/share/bcc/tools/`{{execute T1}}

<pre class="file">
/usr/share/bcc/tools/argdist
/usr/share/bcc/tools/bashreadline
/usr/share/bcc/tools/biolatency
/usr/share/bcc/tools/biosnoop

<< OUTPUT ABRIDGED >>
</pre>

You will be working with several of these tools in the next steps.  The 
tools provided by the bcc-tools package are installed in the 
/usr/share/bcc/tools directory.

