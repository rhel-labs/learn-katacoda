# Working with Transparent Data Encryption in SQL Server

Let's first open up the sqlcmd shell prompt connected to the master database. The master database contains all of the system level information for SQL Server. It gets created when the server instance of SQL Server is created. 

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -d master -N -C`

Use master database to setup the master encryption key.

![Navigate to Image Builder](/rhel-labs/scenarios/sql-server-crypto-policy/assets/MasterKey.png)

`CREATE MASTER KEY ENCRYPTION BY PASSWORD = '1Password!'; GO`{{execute T1}}

> **NOTE:** It is recommended practice to backup the master key as soon as it is created, and store the backup in a secure, off-site location. To backup the master key, use the *BACKUP MASTER KEY* statement in SQL Server.

Create a certificate in the master database 

![Navigate to Image Builder](/rhel-labs/scenarios/sql-server-crypto-policy/assets/Certificate.png)

`CREATE CERTIFICATE MyServerCert WITH SUBJECT = 'My Database Encryption Key Certificate'; GO`{{execute T1}}

Create a database called TestDB to be encrypted 
`CREATE DATABASE TestDB; GO`{{execute T1}}

Switch to the TestDB database 
`USE TestDB; GO`{{execute T1}}

Create database encryption key with AES_256 algorithm and encrypted by server certificate

![Navigate to Image Builder](/rhel-labs/scenarios/sql-server-crypto-policy/assets/DEK.png)

`CREATE DATABASE ENCRYPTION KEY WITH ALGORITHM = AES_256 ENCRYPTION BY SERVER CERTIFICATE MyServerCert; GO`{{execute T1}}

Turn ON database encryption
`ALTER DATABASE TestDB SET ENCRYPTION ON; GO`{{execute T1}}

List the databases that are encrypted. Encrypted_state = 3 means these databases are in encrypted state
`SELECT a.name from sys.dm_database_encryption_keys b join sys.databases a on a.database_id = b.database_id WHERE encryption_state = 3`{{execute T1}}
