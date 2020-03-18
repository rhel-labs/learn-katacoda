When a Critical severity Common Vulnerability and Exposure (CVE) is
announced, Red Hat produces updated software package that include fixes for
the CVE.  However, historically, to apply an updated kernel package,
organizations needed to schedule a system maintenance as the procedure for
applying a new kernel included a system reboot.

Live Kernel Patching is a service provided with a Red Hat Enterprise Linux
subscription.  Red Hat packages Live Kernel Patches (kpatches) for all Critical
severity CVEs, which organizations can apply to their running Red Hat 
Enterprise Linux systems to update the system without scheduling a system
downtime to apply a kernel update to address the CVE.

To get started, install the `kpatch` package:

`yum -y install kpatch`{{execute}}

Now that the `kpatch` application is installed, you can verify that the
system does not currently have any kpatches loaded into the kernel.

`kpatch list`{{execute}}

<pre class=file>
Loaded patch modules:

Installed patch modules:

</pre>


