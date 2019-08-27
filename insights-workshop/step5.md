# Remediating the reported Insight

The reported Insight for OpenSSH had a suggested resolution of 
changing the sshd value for __ClientAliveInterval__ from 900 to
300.

First, verify the value for __ClientAliveInterval__:

`grep '^ClientAliveInterval' /etc/ssh/sshd_config`{{execute}}

<pre class=file>
ClientAliveInterval 900
</pre>

Next, you will edit the file to update the __ClientAliveInterval__ value to 300.  
`sed` is the stream editor utility used in this lab, but you could also use 
another editor to make the change.

`sed -ie 's/^ClientAliveInterval 900/ClientAliveInterval 300/' /etc/ssh/sshd_config`{{execute}}

Verify that the value is now updated:

`grep '^ClientAliveInterval' /etc/ssh/sshd_config`{{execute}}

<pre class=file>
ClientAliveInterval 300
</pre>

Now that the value in the configuration file is updated, restart the
sshd daemon so that it uses the updated value.

`systemctl restart sshd`{{execute}}

Force a Red Hat Insights checkin so that a new batch of system data
is uploaded to the Insights service.

`insights-client`{{execute}}  

<pre class=file>
Starting to collect Insights data for a06560c57e40
Uploading Insights data.
Successfully uploaded report from a06560c57e40 to account 6227255.
</pre>
