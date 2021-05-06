# Registering a machine to Red Hat Insights

In most Red Hat Enterprise Linux 8 installations, the insights-client
software will be installed by default.  However, the minimal package
set does not include installing the insights-client package and other 
versions of Red Hat Enterprise Linux, while the package is available, 
will likely need it installed.  Install the insights-client package on 
the system.

`yum -y install insights-client`{{execute}}

Next, register your system with Red Hat Insights.

`insights-client --register`{{execute}}

<pre class=file>
You successfully registered 988952df-b136-4d71-b807-5a9c1066fddf to account 6227255.
Successfully registered host e5a8aa325c8b
Automatic scheduling for Insights has been enabled.
Starting to collect Insights data for e5a8aa325c8b
Uploading Insights data.
Successfully uploaded report from e5a8aa325c8b to account 6227255.
View the Red Hat Insights console at https://cloud.redhat.com/insights/
</pre>

From the above output, you can observe that the system has been successfully
registered with Red Hat Insights.  As part of the registration,
the machine also uploads a report to Red Hat Insights so that
it may be analyzed for any issues.

For future reference, make note of your system hostname.

`hostname`{{execute}}

<pre class=file>
e5a8aa325c8b
</pre>

>_NOTE:_ Your hostname will be different than the one listed in the output above

At any time in the future, you can get information about Insights registration
by using the `--status` option to `insights-client`.

`insights-client --status`{{execute}}

<pre class=file>
System is registered locally via .registered file. Registered at 2019-08-14T14:12:37.638768
Insights API confirms registration.
</pre>
