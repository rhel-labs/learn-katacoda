# Software installation and configuration
Prior to getting started with image builder, the software must first be 
installed.  By installing the plugin for Web Console, all of the other
required packages will also be installed.

`yum install -y cockpit-composer`{{execute}}

Now that the software is installed, restart the web console so that it picks up
the newly installed plugin for image builder.

`systemctl restart cockpit`{{execute}}

