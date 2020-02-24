Install bpftool utility:

`yum install -y bpftool`{{execute T1}}

Run bpftool to verify that no eBPF programs are currently loaded in the kernel:

`bpftool prog list`{{execute T1}}

Now let's launch some bcc-tools in separate terminals to get started observing yum update:

`/usr/share/bcc/tools/gethostlatency`{{execute T2}}
`/usr/share/bcc/tools/tcplife`{{execute T3}}
`/usr/share/bcc/tools/filetop`{{execute T4}}
`/usr/share/bcc/tools/xfsslower`{{execute T5}}
`/usr/share/bcc/tools/cachestat`{{execute T6}}

Let's now use bpftool to verify what we have loaded in the kernel:

`bpftool prog list`{{execute T1}}

