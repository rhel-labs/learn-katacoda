# マシンイメージの構築

このステップでは、前のステップで変更したexample-http-serverのブループリントを元にマシンイメージを作成します。

`composer-cli` コマンドを使って、example-http-server ブループリントにもとづいた作成を開始します。 このラボでは、次のステップで追加のツールを使わずに仮想マシンイメージの内容に簡単にアクセスできるように、__ext4-filesystem__の出力形式を使用します。 しかし、以下のタイプのイメージのどれでも構築することができます:

| 出力タイプ       |  説明                |
|------------------|:-----------------------:|
| alibaba          |  Alibaba Cloud          |
| ami              |  Amazon EC2             |
| ext4-filesystem  |  ext4 filesystem        |
| google           |  Google Cloud           |
| live-iso         |  Bootable ISO           |
| openstack        |  OpenStack image        |
| partitioned-disk |  partitioned disk image |
| qcow2            |  qcow2 image            |
| tar              |  tar archive            |
| vhd              |  virtual hard disk      |
| vmdk             |  Virtual Machine disk   |


`composer-cli compose start example-http-server ext4-filesystem`{{execute}}

<pre class='file'>
Compose 78915164-320d-4fc3-88d4-91fc40e5f0c8 added to the queue
</pre>

イメージの作成またはビルドは、UUIDによって追跡されますが、上記の出力例では 78915164-320d-4fc3-88d4-91fc40e5f0c8 です。あなたのUUIDは異なっていて、ビルドに固有のものになります。

作成は受け付けた順にキューに入れられ、実施されます。キューの状態は `composer-cli compose status` で確認できます。

`composer-cli compose status`{{execute}}
<pre class='file'>
78915164-320d-4fc3-88d4-91fc40e5f0c8 RUNNING Mon Jul 13 19:42:14 2020 example-http-server 0.0.2 ext4-filesystem  
</pre>

全ての作成について、キューに入っている (WAITING)、実行中 (RUNNING)、完了 (FINISHED) の状態が表示されます。