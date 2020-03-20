# Goal:
After completing this lab, users will be able to apply a Kernel Live Patch to
a system, resolving a security vulnerability without rebooting into an updated
kernel.

#Concepts included in this lab:

* Install Kernel Live Patching software and service
* Deploy a Kernel Live Patch on a running system
* Verify status of a Kernel Live Patch
* Methodology to locate details and information for Common Vulnerabilities and Exposures (CVEs) published by Red Hat

# Example Usecase:

To provide an alternative to emergency kernel maintenance events for
the mitigation of Critical kernel CVEs.  It is expected that after an 
organization has live patched a running kernel that they will, at some point, 
schedule a maintenance window to apply the updated kernel package to the 
system and perform a system reboot.  Kernel Live Patching allows the 
organization to determine when this window occurs rather than the release of 
a fix for a Critical CVE.
