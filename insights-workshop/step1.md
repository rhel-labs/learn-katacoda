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
You successfully registered a6900abd-c0f0-41af-a476-206b92eb3500 to account 6227255.
Successfully registered host 6d9717b56ab7
Automatic scheduling for Insights has been enabled.
Starting to collect Insights data for 6d9717b56ab7
Uploading Insights data.
Successfully uploaded report from 6d9717b56ab7 to account 6227255.
View the Red Hat Insights console at https://cloud.redhat.com/insights/
</pre>

From the above output, you can observe that the system has been successfully
registered with Red Hat Insights.  As part of the registration,
the machine also uploads a report to Red Hat Insights so that
it may be analyzed for any issues.

For future reference, make note of your system hostname.

`hostname`{{execute}}

<pre class=file>
6d9717b56ab7
</pre>

>_NOTE:_ Your hostname will be different than the one listed in the output above

At any time in the future, you can get information about Insights registration
by using the `--status` option to `insights-client`.

`insights-client --status`{{execute}}

<pre class=file>
System is registered locally via .registered file. Registered at 2019-08-14T14:12:37.638768
Insights API confirms registration.
</pre>
