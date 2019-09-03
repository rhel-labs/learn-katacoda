postgresql バージョン 10のストリームが有効なので、インストールを実施します。

`yum -y module install postgresql:10`{{execute}}

postgresql 10のストリームが [i]nstalled になっているはずです。

`yum module list postgresql`{{execute}}

<pre class="file">
Red Hat Enterprise Linux 8 for x86_64 - AppStream Beta (RPMs)
Name                 Stream              Profiles                         Summary
postgresql           10 [d][e]           client, default [d] [i]          postgresql module
postgresql           9.6                 client, default [d]              postgresql module

Hint: [d]efault, [e]nabled, [x]disabled, [i]installed
</pre>

postgresコマンドでもバージョンを確認しましょう。

`postgres --version`{{execute}}

<pre class="file">
postgres (PostgreSQL) 10.6
</pre>
