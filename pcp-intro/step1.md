# Validate Environment and Install PCP

>**Note:** For this scenario, we have started installing SQL Server in the background. The background task will take between 2-5 minutes to complete. 

We have setup two terminal windows running on the local machine - The current terminal will be used for SQL Server and OS specific commands. The *pcp* terminal will be used for running pcp specific commands and looking at the output.

To check if SQL Server installation is complete, we can use the following command -

`systemctl status mssql-server.service --no-pager`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Active: active (running) since Monday 2019-07-15 19:24:18 EDT; 3h 59min left

<< OUTPUT ABRIDGED >>
</pre>

Verify that the Active status is __active (running)__.

Install the PCP packages using yum 

`yum install pcp-zeroconf -y`{{execute T1}}

Start and enable the __PCP's Collector Daemon (PMCD)__ to start collecting system performance data 

`systemctl start pmcd`{{execute T1}}
`systemctl enable pmcd`{{execute T1}}

Check the status of the enabled PMCD service 

`systemctl status pmcd --no-pager`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Active: active (running) since Monday 2019-07-15 19:24:18 EDT; 3h 59min left

<< OUTPUT ABRIDGED >>
</pre>

Verify that the Active status is __active (running)__.
