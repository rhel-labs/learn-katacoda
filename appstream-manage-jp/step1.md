postgresqlで利用可能なバージョンを確認する

`yum module list postgresql`{{execute}}

<pre class=file>
Red Hat Enterprise Linux 8 for x86_64-AppStream (RPMs)
Name                 Stream         Profiles
postgresql           9.6            client, server [d]
postgresql           10 [d]         client, server [d]
postgresql           12             client, server [d]
postgresql           13             client, server [d]

Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled
</pre>


Application Streamの中に2つの利用可能なpostgresqlバージョンが存在しています。バージョン9.6と10そして12です。

postgresql バージョン10がデフォルトになっています。つまり特にオプションや引数を指定せずにpostgresqlをインストールすると、バージョン10がインストールされます。

