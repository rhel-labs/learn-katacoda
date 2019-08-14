# Working with Transparent Data Encryption in SQL Server

Let's first open up the sqlcmd shell prompt connected to the master database. The master database contains all of the system level information for SQL Server. It gets created when the server instance of SQL Server is created. 

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -d master -N -C`{{execute T1}}

Use master database to setup the master encryption key.

![Navigate to Image Builder](/rhel-labs/scenarios/sql-server-crypto-policy/assets/MasterKey.png)

`CREATE MASTER KEY ENCRYPTION BY PASSWORD = '1Password!'`{{execute T1}}

The GO keyword is the default batch terminator in SQL Server, allowing a set of commands to run as a batch.
`GO`{{execute T1}}

> **NOTE:** It is recommended practice to backup the master key as soon as it is created, and store the backup in a secure, off-site location. To backup the master key, use the *BACKUP MASTER KEY* statement in SQL Server.

Create a certificate in the master database 

![Navigate to Image Builder](/rhel-labs/scenarios/sql-server-crypto-policy/assets/Certificate.png)

`CREATE CERTIFICATE MyServerCert WITH SUBJECT = 'My Database Encryption Key Certificate'`{{execute T1}}
`GO`{{execute T1}}

> **NOTE:** In order protect the data from failure event; make sure that back-up the certificate. It is recommended practice to backup the certificate as soon as it is created, and store the backup in a secure, off-site location. To backup the certificate, use the *BACKUP CERTIFICATE* statement in SQL Server.

Create a database called TestDB to be encrypted 
`CREATE DATABASE TestDB`{{execute T1}}
`GO`{{execute T1}}

Switch to the TestDB database 
`USE TestDB`{{execute T1}}
`GO`{{execute T1}}

Create database encryption key (DEK) with AES_256 algorithm and encrypted by server certificate. The DEK is designed to actually encrypt and decrypt the data in your data, log and backup files when you use TDE. The DEK is protected with a certificate. This can be a purchased or self-signed certificate, but in either case, the certificate must reside in the master database of the instance hosting the TDE encrypted database such as the certificate created in the previous step.

![Navigate to Image Builder](/rhel-labs/scenarios/sql-server-crypto-policy/assets/DEK.png)

`CREATE DATABASE ENCRYPTION KEY WITH ALGORITHM = AES_256 ENCRYPTION BY SERVER CERTIFICATE MyServerCert`{{execute T1}}
`GO`{{execute T1}}

Turn ON database encryption
`ALTER DATABASE TestDB SET ENCRYPTION ON`{{execute T1}}
`GO`{{execute T1}}

List the databases that are encrypted. Encrypted_state = 3 means these databases are in encrypted state
`SELECT a.name from sys.dm_database_encryption_keys b join sys.databases a on a.database_id = b.database_id WHERE encryption_state = 3`{{execute T1}}
`GO`{{execute T1}}

You can exit the sqlcmd shell using the exit statement
`exit`{{execute T1}}
