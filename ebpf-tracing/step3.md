Lets now verify that killsnoop is using eBPF for kill() syscall tracing.

Install bpftool utility:

`yum install -y bpftool`{{execute T1}}

Run bpftool to verify that no eBPF programs are currently loaded in the kernel:

`bpftool prog list`{{execute T2}}

In the first terminal run the killsnoop tool:

`/usr/share/bcc/tools/killsnoop`{{execute T1}}

Switch to the Terminal 2 and use bpftool to verify that two BPF programs are now loaded in the kernel, one for execution of kernel function 'syscall__kill' and the other for return form this function.

`bpftool prog list`{{execute T2}}

<pre class="file">
# bpftool prog list
 1: kprobe  name syscall__kill  tag f0fd0853ce76deb8  gpl
	loaded_at 2019-04-10T16:56:19+0200  uid 0
	xlated 344B  jited 221B  memlock 4096B  map_ids 59
 2: kprobe  name do_ret_sys_kill  tag 4559f36196876a23  gpl
	loaded_at 2019-04-10T16:56:19+0200  uid 0
	xlated 384B  jited 245B  memlock 4096B  map_ids 59,60
</pre>

Finally don't forget to go back to the first terminal and exit killsnoop by pressing CTRL+C.
