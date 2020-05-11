# Install Stratis

Stratis consists of two components.

First, the Stratis daemon, stratisd:
* manages collections of block devices
* provides a D-Bus API

Second, the Stratis command-line interface, stratis-cli:
* uses the D-Bus API to communicate with stratisd

To start off, install the stratisd and stratis-cli packages using a software package manager.

`yum -y install stratisd stratis-cli`{{execute}}

You can check the stratis-cli version.

`stratis --version`{{execute}}

<pre class="type">
 2.0.0
</pre>
