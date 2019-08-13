# Working with TDE to encrypt TestDB

The master database contains all of the system level information for SQL Server. It gets created when the server instance of SQL Server is created. Use master database to setup the master encryption keys
`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 1Password! -N -C -Q "use master; go"`{{execute T1}}

Create master key in master database and encrypt this key using a password
`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 1Password! -N -C -Q "CREATE MASTER KEY ENCRYPTION BY PASSWORD = '1TestPassword!'; go"`{{execute T1}}

Create a certificate in the master database 
`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 1Password! -N -C -Q "CREATE CERTIFICATE MyServerCert WITH SUBJECT = 'My Database Encryption Key Certificate'; go"`{{execute T1}}

Create a database called TestDB to be encrypted 
`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 1Password! -N -C -Q "CREATE DATABASE TestDB; go"`{{execute T1}}



