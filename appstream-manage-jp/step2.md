このマシンにデプロイされているアプリケーションの要件にあわせて、postgresql 9.6をインストールします。

`yum -y module install postgresql:9.6`{{execute}} 

インストールが終わったら、postgresql 9.6 がインストールされたことを確認しましょう。

`yum module list postgresql`{{execute}}

<pre class="file">
Red Hat Enterprise Linux 8 for x86_64-AppStream (RPMs)
Name             Stream         Profiles              
postgresql       9.6 [e]        client, server [d] [i]
postgresql       10 [d]         client, server [d]    
postgresql       12             client, server [d]    
postgresql       13             client, server [d]    

Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled
</pre>

バージョン9.6のストリームに [e]nabled のマークがついていて、プロファイルの欄に [i]nstalled のマークがついていることが確認できます。

ねんのため、postgresコマンドでバージョンを確認してみましょう。

`postgres --version`{{execute}}
<pre class=file>
postgres (PostgreSQL) 9.6.22
</pre>
