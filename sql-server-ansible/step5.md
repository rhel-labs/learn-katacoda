# Verify that Microsoft SQL Server is installed on the machine

To verify that SQL Server is running on the machine, lets use the systemctl status command

`systemctl status mssql-server.service --no-pager`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Active: active (running) since Monday 2019-07-15 19:24:18 EDT; 3h 59min left

<< OUTPUT ABRIDGED >>
</pre>

Verify that the Active status is __active (running)__.

Now, let's open up the sqlcmd shell prompt connected to the testDB database. testDB should be created by Ansible playbook, and the sa password credentials is the password setup in the playbook variables. If you haven't changed the sa password in the previous step, you should be able to successfully execute the command below. 

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssWORD! -d testDB -N -C -i ./InstPubs.sql`{{execute}}
