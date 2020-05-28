postgresqlで利用可能なバージョンを確認する

`yum module list postgresql`{{execute}}

<pre class=file>
Red Hat Enterprise Linux 8 for x86_64 - AppStream (RPMs)
Name                        Stream                  Profiles                           Summary
postgresql                  9.6                     client, server [d]                 PostgreSQL server and client module
postgresql                  10 [d]                  client, server [d]                 PostgreSQL server and client module
postgresql                  12                      client, server [d]                 PostgreSQL server and client module

Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled
</pre>


Application Streamの中に2つの利用可能なpostgresqlバージョンが存在しています。バージョン9.6と10です。

postgresql バージョン10がデフォルトになっています。つまり特にオプションや引数を指定せずにpostgresqlをインストールすると、バージョン10がインストールされます。

