# Downloading the Universal Base Image

The Red Hat Universal Base Image (UBI) is produced by Red Hat and is an easy
place to start when containerizing applications.  If you want to read more
about the UBI program, or the three different flavors of UBI, check out the
[FAQ - Universal Base Images](https://developers.redhat.com/articles/ubi-faq)
for additional details.

In this lab, you will be installing additional software into the container
image, however that software runs as an interactive application.  So you will
need `yum`, but do not need `systemd` for managing services within the
container environment.  For that reason, you will be using the __Standard__
UBI image (as opposed to the Minimal or Multi-service images).

By executing the command below, your system will download the Standard UBI
image from Red Hat's registry.

`buildah from registry.access.redhat.com/ubi8/ubi`{{execute T1}}

<pre class="file">
Getting image source signatures
Copying blob 77c58f19bd6e done
Copying blob 47db82df7f3f done
Copying config a1f8c96997 done
Writing manifest to image destination
Storing signatures
ubi-working-container
</pre>

From the output above, you can see that the image was successfully downloaded
and a working container image was created and attached to the system with the
name of __ubi-working-container__.  You will use this working container in the
next steps to install additional software packages into the image.
