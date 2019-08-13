# Working with TDE to encrypt TestDB

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 1Password! -Q "use master; go"`{{execute T1}}

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 1Password! -Q "CREATE MASTER KEY ENCRYPTION BY PASSWORD = '1TestPassword!'; go"`{{execute T1}}
