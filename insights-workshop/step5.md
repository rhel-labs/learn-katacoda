# Remediating the reported Insight

The reported recommendation for NetworkManager had a suggested resolution of 
updating the NetworkManager application.

You will follow the recommendation and apply the updated package to the
system.

`yum -y update NetworkManager`{{execute}}

<pre class=file>
... OUTPUT ABRIDGED ...

Upgraded:
  NetworkManager-1:1.26.0-14.el8_3.x86_64           NetworkManager-libnm-1:1.26.0-14.el8_3.x86_64     
  NetworkManager-team-1:1.26.0-14.el8_3.x86_64      NetworkManager-tui-1:1.26.0-14.el8_3.x86_64       

Complete!
</pre>

Now that the software has been updated, restart the Network Manager service
so that the running copy in memory is also updated with the new version.
`systemctl restart NetworkManager`{{execute}}

Force a Red Hat Insights checkin so that a new batch of system data
is uploaded to Insights.

`insights-client`{{execute}}  

<pre class=file>
Starting to collect Insights data for e5a8aa325c8b
Uploading Insights data.
Successfully uploaded report from e5a8aa325c8b to account 6227255.
View details about this system on cloud.redhat.com:
https://cloud.redhat.com/insights/inventory/38f9bacc-931b-4542-b788-1ab5a0da5a7c
</pre>
