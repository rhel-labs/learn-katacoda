# Install and enable required software

Before you start building images with Imagebuilder, the software required to
perform the tasks must be installed on the system.  Specifically, the 
`composer-cli` package which provides the `composer-cli` command, and the 
`lorax-composer` package which provides the back-end service used to produce
the virtual machine images.

`yum -y install composer-cli lorax-composer`{{execute}}

<pre class='file'>
<<< OUTPUT ABRIDGED >>>

==========================================================================================================================================
 Package                            Arch      Version                                           Repository                           Size
==========================================================================================================================================
Installing:
 composer-cli                       x86_64    28.14.42-2.el8_2                                  rhel-8-for-x86_64-appstream-rpms     84 k
 lorax-composer                     x86_64    28.14.42-2.el8_2                                  rhel-8-for-x86_64-appstream-rpms    155 k
Installing dependencies:
 anaconda-core                      x86_64    29.19.2.17-1.el8                                  rhel-8-for-x86_64-appstream-rpms    2.2 M

<<< OUTPUT ABRIDGED >>>

Complete!
</pre>

Now that the software has been successfully installed on the system, you also
need to activate the `lorax-composer` service so that the `composer-cli`
command can interact with the service that is responsible for queuing and
creating the machine images.

`systemctl enable --now lorax-composer.service`{{execute}}

<pre class='file'>
Created symlink /etc/systemd/system/multi-user.target.wants/lorax-composer.service → /usr/lib/systemd/system/lorax-composer.service.
</pre>

Now that the service is enabled, you are ready to start working with the
Imagebuilder applications to create machine images.
