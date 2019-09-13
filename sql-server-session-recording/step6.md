# Configuring auditing in SQL Server 

Auditing an instance of the SQL Server Database Engine or an individual database involves tracking and logging events that occur on the Database Engine. SQL Server audit lets you create server audits, which can contain server audit specifications for server level events, and database audit specifications for database level events. Audited events can be written to the event logs or to audit files.

Before we connect into SQL Server, let's create the folders to store the audit files

`mkdir /var/opt/mssql/data/audit`{{execute T1}}

Next, let's change ownership of the folder to the mssql user

`chown mssql:mssql /var/opt/mssql/data/audit`{{execute T1}}

Now, let's open up the sqlcmd shell prompt connected to the master database. The master database contains all of the system level information for SQL Server. It gets created when the server instance of SQL Server is created. 

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -d master -N -C`{{execute T1}}

Use master database to create a server audit specification

`CREATE SERVER AUDIT AuditDataAccess TO FILE ( FILEPATH ='/var/opt/mssql/data/audit' ) WITH ( QUEUE_DELAY = 0,  ON_FAILURE = CONTINUE) WHERE object_name = 'SensitiveData'`{{execute T1}}

The GO keyword is the default batch terminator in SQL Server, allowing a set of commands to run as a batch.
`GO`{{execute T1}}

Enable the server audit
`ALTER SERVER AUDIT AuditDataAccess WITH (STATE = ON)`{{execute T1}}
`GO`{{execute T1}}

Next, let's create our table objects and database audit specification in our TestDB database

Create a database called TestDB and the schema for our objects
`CREATE DATABASE TestDB`{{execute T1}}
`GO`{{execute T1}}

Change context to use TestDB database
`USE TestDB`{{execute T1}}
`GO`{{execute T1}}

`CREATE SCHEMA DataSchema`{{execute T1}}
`GO`{{execute T1}}

Create the database tables
`CREATE TABLE DataSchema.GeneralData (ID int PRIMARY KEY, DataField varchar(50) NOT NULL)`{{execute T1}}  
`GO`{{execute T1}}  

`CREATE TABLE DataSchema.SensitiveData (ID int PRIMARY KEY, DataField varchar(50) NOT NULL)`{{execute T1}}  
`GO`{{execute T1}}

Enable the database audit corresponding to the server audit
`CREATE DATABASE AUDIT SPECIFICATION [FilterForSensitiveData] FOR SERVER AUDIT [AuditDataAccess] ADD (SELECT, INSERT ON DataSchema.SensitiveData by public) WITH (STATE = ON)`{{execute T1}}
`GO`{{execute T1}}

Insert into sensitive data table
`INSERT into DataSchema.SensitiveData values (1, '1234')`{{execute T1}}
`GO`{{execute T1}}

Select from sensitive data table
`SELECT * from DataSchema.SensitiveData`{{execute T1}}
`GO`{{execute T1}}

Check for audit records
`SELECT @@spid, session_id, statement FROM fn_get_audit_file('/var/opt/mssql/data/audit/*.sqlaudit',default,default)`{{execute T1}}
`GO`{{execute T1}}

Verify that the output has 2 records indicating that INSERT, and SELECT statements were executed against the SensitiveData table

<pre class="file">
<< OUTPUT ABRIDGED >>

<active-session-id>  <session-id> INSERT into DataSchema.SensitiveData values (1, '1234')
<active-session-id>  <session-id> SELECT * from DataSchema.SensitiveData

<< OUTPUT ABRIDGED >>
</pre>

You can exit the sqlcmd shell using the exit statement
`exit`{{execute T1}}
