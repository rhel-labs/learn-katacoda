An update to the web application running on this system requires features available in postgresql version 10.
To accomplish this you will ultimately remove postgresql 9.6 and install postgresql 10, however, there are some
additional Application Stream settings to apply to the system configuration as well.

To start off with, remove postgresql 9.6.

`yum -y module remove postgresql:9.6`{{execute}}

Take a look at the Application Stream information for the machine to validate the removal.

`yum  module list postgresql`{{execute}}

<pre class="file">
Red Hat Enterprise Linux 8 for x86_64 - AppStream Beta (RPMs)
Name                 Stream              Profiles                         Summary
postgresql           10 [d]              client, default [d]              postgresql module
postgresql           9.6 [e]             client, default [d]              postgresql module

Hint: [d]efault, [e]nabled, [x]disabled, [i]installed
</pre>

Verify that postgresql version 9.6 is no longer flagged as [i]nstalled
