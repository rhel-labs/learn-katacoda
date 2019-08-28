# アプリケーションコンテナの立ちあげと情報取得

`podman` でコンテナを管理する方法については ["Deploying containers with container tools (JP)"](https://lab.redhat.com/podman-deplo-jp) シナリオもご覧ください。

`podman images` でイメージの情報を取得します。

`podman images`{{execute T1}}

<pre class="file">
REPOSITORY                                 TAG      IMAGE ID       CREATED              SIZE
localhost/el-httpd2                        latest   d074aab93289   About a minute ago   505 MB
localhost/el-httpd1                        latest   b04fe2c73b03   6 minutes ago        279 MB
registry.access.redhat.com/ubi8-init       latest   8c376a94293d   2 weeks ago          231 MB
</pre>

名前が `buildah commit` で指定したものと同じことがわかります。

`podman` と `buildah` はホスト上で同じストレージを利用しているので、構築したイメージはすぐに `podman` から実行できます。

`podman run -d -p 80:80 el-httpd2`{{execute T1}}

<pre class="file">
561019c2a69fd3826bcaf4a62240ba2b5edd542e664bd2fee0381da746d58d95
</pre>

`podman` でアプリケーションコンテナの状態を見てみましょう。

`podman ps`{{execute T1}}

<pre class="file">
CONTAINER ID  IMAGE                       COMMAND     CREATED         STATUS             PORTS               NAMES
561019c2a69f  localhost/el-httpd2:latest  /sbin/init  13 seconds ago  Up 13 seconds ago  0.0.0.0:80->80/tcp  suspicious_sammet
</pre>

ポートとコマンドが `buildah config` で指定したメタデータに一致していることがわかります。

アプリケーションコンテナのイメージのメタデータは、 `buildah inspect` で参照できます。

`buildah inspect localhost/el-httpd2`{{execute T1}}

<pre class="file">
"rootfs": {
            "type": "layers",
            "diff_ids": [
                "sha256:6d0bba8b32ffa211bb78d415b96d67dd7955cb30b1f86555d9c9f0da9a914626"
            ]
        },
</pre>

JSON出力の `rootfs` セクションを見ます。`buildah commit` サブコマンドで作成された1レイヤだけが存在します。

***Container httpd*** タブをクリックして、アプリケーションコンテナにデプロイされた index.html を見てみましょう。

>_NOTE:_ 新しいページを見る前に *refresh* アイコンを押す必要があるかもしれません
