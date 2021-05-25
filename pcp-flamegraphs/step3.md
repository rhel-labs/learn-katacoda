# Optimizing the MySQL workload on Red Hat Enterprise Linux

For this step, we will be switching back to our *Terminal* tab. 

`mysql -e "use sampleDB; EXPLAIN format=tree create index idx_t1_c2 on t1(c2);"`{{execute T1}}


To list the PCP PMDA packages related to Microsoft SQL Server -

`yum search pcp-pmda | grep "Microsoft SQL Server"`{{execute T1}}

<pre class="file">
Last metadata expiration check: 0:24:59 ago on Fri 12 Mar 2021 09:20:29 AM EST.
pcp-pmda-mssql.x86_64 : Performance Co-Pilot (PCP) metrics for Microsoft SQL Server
</pre>

Install the PCP PMDA package for Microsoft SQL Server - 

`sudo yum install pcp-pmda-mssql -y`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>
Installed:
  pcp-pmda-mssql-5.1.1-4.el8_3.x86_64                                                                 
<< OUTPUT ABRIDGED >>
</pre>

Create a new user in SQL Server to be used by PCP. The next command uses `sqlcmd` to run a SQL script file called createUser.sql. The script creates a SQL Server user login called `pcpLogin` and only grants limited SQL Server privileges that are needed by PCP. 

<pre class="file">
//Create a SQL Server login and user associated with that login. Grant VIEW SERVER STATE AND VIEW DATABASE STATE permissions to the user

CREATE LOGIN pcpLogin WITH PASSWORD = 'RedHat1!';
CREATE USER pcpUser FOR LOGIN pcpLogin;  

GRANT VIEW SERVER STATE TO pcpUser;
GRANT VIEW DATABASE STATE TO pcpUser;
</pre>

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i createUser.sql`{{execute T1}}

View the contents of the SQL Server PMDA configuration file 

`cat /var/lib/pcp/pmdas/mssql/mssql.conf`{{execute T1}}

So that PCP can connect to SQL Server with a low privileged SQL Server account, update the Login name in the configuration file 

`sed -i 's/sa/pcpLogin/g' /var/lib/pcp/pmdas/mssql/mssql.conf`{{execute T1}}

Update the password corresponding to the low privileged account in the configuration file 

`sed -i 's/P4$$W0rd/Redhat1!/g' /var/lib/pcp/pmdas/mssql/mssql.conf`{{execute T1}}

Make sure the configuration file is owned by the root user and group, and that appropriate permissions are set 

`chown root:root /var/lib/pcp/pmdas/mssql/mssql.conf`{{execute T1}}

`chmod 400 /var/lib/pcp/pmdas/mssql/mssql.conf`{{execute T1}}

## Install the SQL Server PMDA agent

Install the PMDA agent for SQL Server

`cd /var/lib/pcp/pmdas/mssql; ./Install`{{execute T1}}

<pre class="file">
Updating the Performance Metrics Name Space (PMNS) ...
Terminate PMDA if already installed ...
Updating the PMCD control file, and notifying PMCD ...
Check mssql metrics have appeared ... 168 metrics and 601 values
</pre>

>**Note:** The successful message indicating that mssql metrics have appeared
