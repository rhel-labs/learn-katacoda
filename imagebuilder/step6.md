# Create a virtual machine image

After the previous step, you should see the **example-http-server** blueprint
homepage.  On this page you can make somne additional customizations to the
blueprint (like adding a user account or hostname), view the packages included
in the blueprint, view images made from this blueprint, or go back to edit the
packages included in the blueprint.

However, now that you have added nodejs to the blueprint packages, it is now
time to create a virtual machine image.  Use the **Create Image** button to
start this process:

![Create Image](/rhel-labs/scenarios/imagebuilder/assets/Create-Image-init.png)

A dialog will appear so that you can select the output format of your image.
There are several options from local virtualization deployments, public, or
private cloud providers.  For this exercise, select 
**QEMU QCOW2 Image (.qcow2)** which is a format used for the native Red Hat
Enterprise Linux virtualization technology, KVM.

![Select Output Format](/rhel-labs/scenarios/imagebuilder/assets/Select-Format.png)

Once the format is determined, it is time to click the **Create** button to
initiate the machine build.

![Create Image with Format Selected](/rhel-labs/scenarios/imagebuilder/assets/Create-Confirm.png)

You will see a notification that the image has now been added to the Image
Builder queue for building.

![Create Image Confirmation](/rhel-labs/scenarios/imagebuilder/assets/Create-Confirm-Dialog.png)

