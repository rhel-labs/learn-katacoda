# Verify issue resolved

Finally, reload the system page in your web browser.  
Look to verify that the Insight related to ownership of SQL Server /var/opt/mssql is no longer displayed 
for your machine.

You can also verify that SQL Server is now running on the machine

`systemctl status mssql-server.service --no-pager`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>
Active: active (running) since Tue 2020-03-10 15:22:53 EDT; 1min 56s ago
<< OUTPUT ABRIDGED >>
</pre>

Verify that the Active status is __Active (running)__.


