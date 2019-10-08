postgresqlで利用可能なバージョンを確認する

`yum module list postgresql`{{execute}}

<pre class=file>
Red Hat Enterprise Linux 8 for x86_64 - AppStream Beta (RPMs)
Name                 Stream              Profiles                         Summary
postgresql           10 [d]              client, default [d]              postgresql module
postgresql           9.6                 client, default [d]              postgresql module

Hint: [d]efault, [e]nabled, [x]disabled, [i]installed

</pre>


Application Streamの中に2つの利用可能なpostgresqlバージョンが存在しています。バージョン9.6と10です。

postgresql バージョン10がデフォルトになっています。つまり特にオプションや引数を指定せずにpostgresqlをインストールすると、バージョン10がインストールされます。

