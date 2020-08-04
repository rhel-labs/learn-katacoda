# Deploy the client-tools container

Create a new container runtime from the image which uses the mssql-tools image and start an interactive bash shell inside the container.

`podman run -it mcr.microsoft.com/mssql-tools`{{execute T3}}

Once inside the container, connect  with sqlcmd. Note that sqlcmd is not in the path by default, so you have to specify the full path.

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P '<YourPassword>'
  

<pre class="file">
TBD
</pre>
