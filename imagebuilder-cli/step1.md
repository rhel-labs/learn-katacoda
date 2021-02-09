# Install and enable required software

Before you start building images with image builder, the software required to
perform the tasks must be installed on the system.  Specifically, the
`composer-cli` package which provides the `composer-cli` command, and the
`osbuild-composer` package which provides the back-end service used to produce
the virtual machine images.

`yum -y install composer-cli osbuild-composer`{{execute}}

<pre class='file'>
<<< OUTPUT ABRIDGED >>>

==========================================================================================================================================
 Package                            Arch      Version                                           Repository                           Size
==========================================================================================================================================
  Installing:
   composer-cli             x86_64  28.14.55-2.el8                              rhel-8-for-x86_64-appstream-rpms   86 k
   osbuild-composer         x86_64  20.1-1.el8                                  rhel-8-for-x86_64-appstream-rpms  2.8 M
  Installing dependencies:
   fuse                     x86_64  2.9.7-12.el8                                rhel-8-for-x86_64-baseos-rpms      83 k
   fuse-common              x86_64  3.2.1-12.el8                                rhel-8-for-x86_64-baseos-rpms      21 k
   osbuild                  noarch  18-3.el8                                    rhel-8-for-x86_64-appstream-rpms   53 k
   osbuild-composer-worker  x86_64  20.1-1.el8                                  rhel-8-for-x86_64-appstream-rpms  3.3 M
   osbuild-ostree           noarch  18-3.el8                                    rhel-8-for-x86_64-appstream-rpms   17 k
   osbuild-selinux          noarch  18-3.el8                                    rhel-8-for-x86_64-appstream-rpms   25 k
   ostree                   x86_64  2020.5-4.el8                                rhel-8-for-x86_64-appstream-rpms  242 k
   ostree-libs              x86_64  2020.5-4.el8                                rhel-8-for-x86_64-appstream-rpms  414 k

<<< OUTPUT ABRIDGED >>>

Complete!
</pre>

Now that the software has been successfully installed on the system, you also need to activate the `lorax-composer` service so that the `composer-cli`
command can interact with the service that is responsible for queuing and creating the machine images.

`systemctl enable --now osbuild-composer.service`{{execute}}

<pre class='file'>
Created symlink /etc/systemd/system/multi-user.target.wants/osbuild-composer.service → /usr/lib/systemd/system/osbuild-composer.service.
</pre>

Now that the service is enabled, you are ready to start working with image builder to create machine images.
