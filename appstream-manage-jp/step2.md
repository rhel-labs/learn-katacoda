このマシンにデプロイされているアプリケーションの要件にあわせて、postgresql 9.6をインストールします。

`yum -y module install postgresql:9.6`{{execute}} 

インストールが終わったら、postgresql 9.6 がインストールされたことを確認しましょう。

`yum module list postgresql`{{execute}}

<pre class="file">
Red Hat Enterprise Linux 8 for x86_64 - AppStream Beta (RPMs)
Name                 Stream              Profiles                         Summary
postgresql           10 [d]              client, default [d]              postgresql module
postgresql           9.6 [e]             client, default [d] [i]          postgresql module

Hint: [d]efault, [e]nabled, [x]disabled, [i]installed
</pre>

バージョン9.6のストリームに [e]nabled のマークがついていて、プロファイルの欄に [i]nstalled のマークがついていることが確認できます。

ねんのため、postgresコマンドでバージョンを確認してみましょう。

`postgres --version`{{execute}}
<pre class=file>
postgres (PostgreSQL) 9.6.10
</pre>
