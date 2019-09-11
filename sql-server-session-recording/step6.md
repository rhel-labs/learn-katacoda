# Configuring auditing in SQL Server 

Auditing an instance of the SQL Server Database Engine or an individual database involves tracking and logging events that occur on the Database Engine. SQL Server audit lets you create server audits, which can contain server audit specifications for server level events, and database audit specifications for database level events. Audited events can be written to the event logs or to audit files.

Let's first open up the sqlcmd shell prompt connected to the master database. The master database contains all of the system level information for SQL Server. It gets created when the server instance of SQL Server is created. 

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -d master -N -C`{{execute T1}}

Use master database to create a server audit specification

`CREATE SERVER AUDIT AuditDataAccess TO FILE ( FILEPATH ='/var/opt/mssql/data/audit' ) WITH ( QUEUE_DELAY = 1000,  ON_FAILURE = CONTINUE) WHERE object_name = 'SensitiveData'`{{execute T1}}

The GO keyword is the default batch terminator in SQL Server, allowing a set of commands to run as a batch.
`GO`{{execute T1}}

Next, let's create our table objects and database audit specification in our TestDB database

Create a database called TestDB and the schema for our objects
`CREATE DATABASE TestDB`{{execute T1}}
`GO`{{execute T1}}

`CREATE SCHEMA DataSchema`{{execute T1}}
`GO`{{execute T1}}

Create the database tables
`CREATE TABLE DataSchema.GeneralData (ID int PRIMARY KEY, DataField varchar(50) NOT NULL)`{{execute T1}}  
`GO`{{execute T1}}  

`CREATE TABLE DataSchema.SensitiveData (ID int PRIMARY KEY, DataField varchar(50) NOT NULL)`{{execute T1}}  
`GO`{{execute T1}}

Enable the server audit


-- Enable the server audit
ALTER SERVER AUDIT AuditDataAccess WITH (STATE = ON) ;
GO

`CREATE DATABASE ENCRYPTION KEY WITH ALGORITHM = AES_256 ENCRYPTION BY SERVER CERTIFICATE MyServerCert`{{execute T1}}
`GO`{{execute T1}}

List the databases that are encrypted. Encrypted_state = 3 means these databases are in encrypted state
`SELECT a.name from sys.dm_database_encryption_keys b join sys.databases a on a.database_id = b.database_id WHERE encryption_state = 3`{{execute T1}}
`GO`{{execute T1}}

You can exit the sqlcmd shell using the exit statement
`exit`{{execute T1}}
