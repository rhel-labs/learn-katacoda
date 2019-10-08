このシステムで動作しているwebアプリケーションがアップデートされ、postgresql 10での新機能が必要になりました。
この条件を満たすためpostgresql 9.6を削除して、postgresql 10をインストールします。しかし、そのためには
Application Streamの設定をいくつか行う必要があります。

まずは、postgresql 9.6を削除しましょう。

`yum -y module remove postgresql:9.6`{{execute}}

Application Streamの情報を満て、削除されていることを確認します。

`yum  module list postgresql`{{execute}}

<pre class="file">
Red Hat Enterprise Linux 8 for x86_64 - AppStream Beta (RPMs)
Name                 Stream              Profiles                         Summary
postgresql           10 [d]              client, default [d]              postgresql module
postgresql           9.6 [e]             client, default [d]              postgresql module

Hint: [d]efault, [e]nabled, [x]disabled, [i]installed
</pre>

postgresql 9.6に、[i]nstalledのフラグがないことがわかります。
