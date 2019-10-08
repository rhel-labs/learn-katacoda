# 既存のベースイメージからアプリケーションイメージを作成する

**buildah** でイメージを作成するには2つの方法があります:
* サブコマンドを利用して内容を変更する
* ホストツールを利用してコンテナのファイルシステムを変更する

まず、サブコマンドを使ってコンテナの中身を(保存せず)変更していく方法を見ましょう。多くの **buildah** サブコマンドは OCIFileの命令と同様に動作します。このため自動化する時にも簡単です。

Red Hat Enterprise Linux のパッケージを利用したコンテナを作る開始点として、Red Hat Universal Base Image 8 が提供されています。UBIについて詳しくは[紹介blog記事](https://www.redhat.com/en/blog/introducing-red-hat-universal-base-image)を参照ください。

アプリケーションイメージを `ubi-init` ベースイメージから作るため、`buildah`で作業用コンテナをを作ります。作業用コンテナはbuildahコマンドの対象となる一時的なコンテナです。

`buildah from registry.access.redhat.com/ubi8/ubi-init`{{execute T1}}

<pre class="file">
ubi-init-working-container
</pre>

このサブコマンドは OCIFile の FROM命令と同じように動作し、ソースイメージをホストで利用できるようにします。

buildahは作業用コンテナの名前として、イメージの名前のあとに `-working-container` をついけたものを利用します。もし同じ名前のコンテナが既にあれば、名前に数字を追加します。
