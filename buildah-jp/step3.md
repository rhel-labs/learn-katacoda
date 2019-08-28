# アプリケーションコンテナの立ちあげと情報取得

`podman` でコンテナを管理する方法については ["Deploying containers with container tools (JP)"](https://lab.redhat.com/podman-deplo-jp) シナリオもご覧ください。

`podman images` でイメージの情報を取得します。

`podman images`{{execute T1}}

<pre class="file">
REPOSITORY                                 TAG      IMAGE ID       CREATED          SIZE
localhost/el-httpd1                        latest   b04fe2c73b03   24 seconds ago   279 MB
registry.access.redhat.com/ubi8/ubi-init   latest   8c376a94293d   2 weeks ago      231 MB
</pre>


名前が `buildah commit` で指定したものと同じことがわかります。

`podman` と `buildah` はホスト上で同じストレージを利用しているので、構築したイメージはすぐに `podman` から実行できます。

`podman run -d -p 80:80 el-httpd1`{{execute T1}}

<pre class="file">
f4d9db69e9b512517f9490d3bcc5096e69cca5e9b3a50b3890430da39ae46573
</pre>

`podman` でアプリケーションコンテナの状態を見てみましょう。

`podman ps`{{execute T1}}

<pre class="file">
CONTAINER ID  IMAGE                       COMMAND     CREATED         STATUS             PORTS               NAMES
f4d9db69e9b5  localhost/el-httpd1:latest  /sbin/init  16 seconds ago  Up 16 seconds ago  0.0.0.0:80->80/tcp  relaxed_wilson
</pre>

ポートとコマンドが `buildah config` で指定したメタデータに一致していることがわかります。

アプリケーションコンテナのイメージのメタデータは、 `buildah inspect` で参照できます。

`buildah inspect localhost/el-httpd1`{{execute T1}}

<pre class="file">
"rootfs": {
    "type": "layers",
    "diff_ids": [
        "sha256:24d85c895b6b870f6b84327a5e31aa567a5d30588de0a0bdd9a669ec5012339c",
        "sha256:c613b100be1645941fded703dd6037e5aba7c9388fd1fcb37c2f9f73bc438126",
        "sha256:188ab351dfda8afc656a38073df0004cdc5196fd5572960ff5499c17e6442223",
        "sha256:2aa09f066ed0ce8aad332cbefe237cbe05777f5790bccfdcda439aff5f5f7509"
    ]
},
</pre>

JSON出力の `rootfs` セクションを見ます。`buildah` のサブコマンド実行それぞれに対応したレイヤが存在します。

***Container httpd*** タブをクリックして、アプリケーションコンテナにデプロイされた index.html を見てみましょう。

次のステップに進む前に、実行中の全てのコンテナを終了します:
l
`podman stop -a`{{execute T1}}
