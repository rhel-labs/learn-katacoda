# Prerequisite setup
Prior to getting started with image builder, the software must first be 
installed.

`yum install -y cockpit-composer lorax-composer composer-cli`{{execute}}

Now that the software is installed, restart the web console so that it picks up
the newly installed plugin for image builder.  Also, you will enable the 
service that manages the build queue and other aspects of image builder.

`systemctl restart cockpit; systemctl enable --now lorax-composer.service`{{execute}}

Lastly, in the next steps, you will use a non-administrative user, __rhel__, to 
manage the image blueprints and build machine images.  This user must belong to
the __weldr__ group.

`usermod -a -G weldr rhel`{{execute}}
