# Updating a package

The `list` subcommand is useful for finding out which packages have available
updates on the system.

`yum list updates`{{execute}}

<pre class=file>
<< OUTPUT ABRIDGED >>
Available Upgrades
bash.x86_64              4.4.20-1.el8_4                             rhel-8-for-x86_64-baseos-rpms
bind-export-libs.x86_64  32:9.11.26-4.el8_4                         rhel-8-for-x86_64-baseos-rpms
buildah.x86_64           1.19.7-2.module+el8.4.0+11311+9da8acfb     rhel-8-for-x86_64-appstream-rpms
<< OUTPUT ABRIDGED >>
</pre>

Many packages on this system have updates available. Specifying a
package name with `yum update` will constrain this operation to only look
for that package.

>_NOTE:_ If you instead want to make sure your entire system is up to date,
running `yum update` without any other arguments apply updates for all
packages on your system (including YUM itself).

For this example, just update the __bash__ package. Once again, use the `-y`
option to automatically say yes to any prompts for the purposes of this lab.

`yum update -y bash`{{execute}}

<pre class=file>
<< OUTPUT ABRIDGED >>
===============================================================
 Package                Architecture       Size
===============================================================
Upgrading:
 bash                   x86_64             1.5 M

Transaction Summary
===============================================================
Upgrade  1 Package

<< OUTPUT ABRIDGED >>
</pre>

>_NOTE:_ You sometimes see the subcommand `upgrade` being used somewhat interchangeably
with `update`. The difference between these two subcommands is that `upgrade` will
remove any obsolete packages from the system. Often the configuration for YUM
is such that these subcommands will both carry out the `upgrade` operation.  

# Removing a package

Removing a package follows the same theme of simplicity.

`yum remove -y httpd`{{execute}}

The extensive output shows you information about which dependent RPMs were
removed as part of this transaction.

<pre class=file>
<< OUTPUT ABRIDGED >>
Removing:
 httpd            x86_64 2.4.37-39.module+el8.4.0+9658+b87b2deb

Removing dependent packages:
 mod_ssl          x86_64 1:2.4.37-39.module+el8.4.0+9658+b87b2deb

Removing unused dependencies:
 apr              x86_64 1.6.3-11.el8

<< OUTPUT ABRIDGED >>

Removed:
  httpd-2.4.37-39.module+el8.4.0+9658+b87b2deb.x86_64               
  httpd-filesystem-2.4.37-39.module+el8.4.0+9658+b87b2deb.noarch    
  httpd-tools-2.4.37-39.module+el8.4.0+9658+b87b2deb.x86_64  

Complete!
</pre>

Use the `list` subcommand to confirm that the package has been uninstalled:

`yum list httpd`{{execute}}

<pre class=file>
<< OUTPUT ABRIDGED >>
Available Packages
httpd.x86_64 2.4.37-39.module+el8.4.0+9658+b87b2deb
</pre>

The package is now listed as _Available_ rather than _Installed_. The next
step will walk you through `yum history` which provides some more powerful
tools for rolling back package transactions.
