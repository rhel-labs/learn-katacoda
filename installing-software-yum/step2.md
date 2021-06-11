# Updating a package

If you wish to check whether or not a particular package is up to date, the
`update` subcommand will check for and install available updates. Specifying a
package name will constrain this operation to only look for that package. Once again,
use the `-y` option to automatically say yes to any prompts.

`yum update -y httpd`{{execute}}

<pre class=file>
<< OUTPUT ABRIDGED >>
===========================================================================================================================================
 Package                    Architecture   Version                                          Repository                                Size
===========================================================================================================================================
Upgrading:
 httpd                      x86_64         2.4.37-39.module+el8.4.0+9658+b87b2deb           rhel-8-for-x86_64-appstream-rpms         1.4 M
 httpd-filesystem           noarch         2.4.37-39.module+el8.4.0+9658+b87b2deb           rhel-8-for-x86_64-appstream-rpms          38 k
 httpd-tools                x86_64         2.4.37-39.module+el8.4.0+9658+b87b2deb           rhel-8-for-x86_64-appstream-rpms         106 k
 mod_ssl                    x86_64         1:2.4.37-39.module+el8.4.0+9658+b87b2deb         rhel-8-for-x86_64-appstream-rpms         134 k
 redhat-logos-httpd         noarch         84.4-1.el8                                       rhel-8-for-x86_64-baseos-rpms             29 k

Transaction Summary
===========================================================================================================================================
Upgrade  5 Packages

<< OUTPUT ABRIDGED >>
</pre>


>_NOTE:_ You sometimes see the subcommand `upgrade` being used somewhat interchangeably
with `update`. The difference between these two subcommands is that `upgrade` will
remove any obsolete packages from the system. Often the configuration for YUM
is such that these subcommands will both carry out the upgrade operation.  

If you instead want to just make sure your entire system is up to date, running
`yum update` without any other arguments will check for updates for all
packages on your system (including YUM itself).

# Removing a package

Removing a package follows the same theme of simplicity.

`yum remove crontabs.noarch`{{execute}}

<pre class=file>
<< OUTPUT ABRIDGED >>
Running transaction
  Preparing
  Erasing          : crontabs-1.11 16.20150630git.el8.noarch
warning: /etc/crontab saved as /etc/crontab.rpmsave
<< OUTPUT ABRIDGED >>

Removed:
  cronie-1.5.2-4.el8.x86_64             cronie-anacron-1.5.2-4.el8.x86_64             crontabs-1.11-16.20150630git.el8.noarch     

Complete!
</pre>

Another notable portion of the output above is that YUM automatically
stored the contents of `/etc/crontab` in a backup file, `/etc/crontab.rpmsave`.
Use the `list` subcommand to confirm that the package has been uninstalled:

`yum list crontabs`{{execute}}

<pre class=file>
<< OUTPUT ABRIDGED >>
Available Packages
crontabs.noarch                                    1.11-17.20190603git.el8  
</pre>

The package is now listed as _Available_ rather than _Installed_. The next
step will walk you through `yum history` which provides some more powerful
tools for rolling back package transactions.
