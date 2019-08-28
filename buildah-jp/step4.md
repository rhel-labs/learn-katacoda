# スクラッチからアプリケーションイメージを作成する

`buildah` では既存のイメージから始める以外の方法もあります。`buildah`は、メタデータと空のファイルシステムを持つ最小限のイメージを作ることができます。

このスタイルのイメージを作るには `buildah from` に  `scratch` という特別なターゲットを指定します。

`buildah from scratch`{{execute T1}}

<pre class="file">
working-container
</pre>

もととなるイメージがないため、作業用コンテナは `working-container` という名前になります。

スクラッチコンテナに対してホストのツールを使って作業をするため、コンテナのファイルシステムを `buildah mount` でマウントすることができます。

> _NOTE:_ このあとの作業を簡単にするため、 `buildah` コマンドの出力を *scratchmnt* 変数に保存します。

`scratchmnt=$(buildah mount working-container)`{{execute T1}}

`echo ${scratchmnt}`{{execute T1}}

<pre class="file">
/var/lib/containers/storage/overlay/5199b9cbf441fe93e3629f9d6336fd7008858b9b6e23629a724ccc2f567f3feb/merged
</pre>

ディレクトリは現在、空の状態です。

`ls -l ${scratchmnt}`{{execute T1}}

<pre class="file">
total 0
</pre>
