# Install Stratis

To start off, install the stratisd and stratis-cli packages using a software package manager. For this tutorial, we will use DNF.

Check if the stratisd and stratis-cli packages are installed.

`dnf list installed | grep stratis`{{execute}}

If these packages are not found, continue with the installation.

`dnf -y install stratisd stratis-cli`{{execute}}

You can check the stratis-cli version.

`stratis --version`{{execute}}
