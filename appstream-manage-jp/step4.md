新しいバージョンを利用可能にする前に、古い(今削除した)バージョンを無効にする必要があります。

`yum -y module disable postgresql:9.6`{{execute}}

同じように、バージョン10を(デフォルトですが)enableします。

`yum -y module enable postgresql:10`{{execute}}

Application Streamの情報を満て、postgresql バージョン 10 が有効になっていることを確認しましょう。

`yum  module list postgresql`{{execute}}

<pre class="file">
Red Hat Enterprise Linux 8 for x86_64 - AppStream Beta (RPMs)
Name                 Stream              Profiles                         Summary
postgresql           10 [d][e]           client, default [d]              postgresql module
postgresql           9.6                 client, default [d]              postgresql module

Hint: [d]efault, [e]nabled, [x]disabled, [i]installed
</pre>

postgresql バージョン 10に [e]nabled フラグがついていることがわかります。
