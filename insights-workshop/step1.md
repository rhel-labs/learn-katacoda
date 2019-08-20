# Registering a machine to the Red Hat Insights service

First, register your system with Red Hat Subscription Manager.  When
prompted, use the following credentials:

Username: **Provided by workshop facilitator**
Password: **Redhat1!**

`subscription-manager register`{{execute}}

<pre class=file>
Registering to: subscription.rhsm.redhat.com:443/subscription
Username: **<Provided by workshop facilitator>** 
Password: **RedHat1!**
The system has been registered with ID: ab3c439f-4957-4be5-a1c0-7c90f1ba3aa2
The registered system name is: 7e34ba28d1fd
</pre>

Red Hat Subscription Manager is what tracks and manages subscription
usage.  It also manages software repositories made available to the
system.   

In most Red Hat Enterprise Linux 8 installations, the insights-client
software will be installed by default.  However, the minimal package
set does not include installing the insights-client package and other 
versions of Red Hat Enterprise Linux, while the package is available, 
will likely need it installed.  Install the insights-client package on 
the machine.

`yum -y install insights-client`{{execute}}

Next, register your system with Red Hat Insights.

`insights-client --register`{{execute}}

<pre class=file>
You successfully registered 3c7e6bd4-2673-4d67-83f6-97cd2e420503 to account 6227255.
Successfully registered host a06560c57e40
Automatic scheduling for Insights has been enabled.
Starting to collect Insights data for a06560c57e40
Uploading Insights data.
Successfully uploaded report from a06560c57e40 to account 6227255.
</pre>

From the above output, you can observe that the system has been successfully
registered with the Red Hat Insights service.  As part of the registration,
the machine also uploads a report to the Red Hat Insights service so that
it may be analized for any Insights.

For future reference, make note of your system hostname.

`hostname`{{execute}}

<pre class=file>
a06560c57e40
</pre>

>_NOTE:_ Your hostname will be different than the one listed in the output above

At any time in the future, you can get information about Insights registration
by using the `--status` option to `insights-client`.

`insights-client --status`{{execute}}

<pre class=file>
System is registered locally via .registered file. Registered at 2019-08-14T14:12:37.638768
Insights API confirms registration.
</pre>
