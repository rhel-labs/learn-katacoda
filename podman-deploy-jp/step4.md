対話的なコンテナの実行はうまくいきました。コンテナが非対話的なアプリケーションやサービスを提供する場合はどのように扱うのでしょう。

例として __rhel8-httpd__ コンテナは、その中でApache webサーバを実行するよう設定されています。
以下のコマンドで、このコンテナの新しいインスタンスをデタッチドモードで作成し、
Apache webサーバ用のポートフォワードの設定を行います。
ホストのポート8081への接続は、実行中のコンテナのポート80(Apache)へリダイレクトされます。

`podman run -dt -p 8081:80/tcp rhel8-httpd`{{execute T1}}

コンテナの状態を __podman ps__ を使って確認しましょう:

`podman ps -a`{{execute T2}}

<pre class="file">
CONTAINER ID  IMAGE                         COMMAND               CREATED         STATUS             PORTS                   NAMES
2b2571efec6f  localhost/rhel8-httpd:latest  /usr/sbin/httpd -...  13 seconds ago  Up 12 seconds ago  8081->80/tcp  priceless_mahavira
</pre>

__STATUS__ が __Up__ であることがわかります。__PORTS__ 欄はコンテナで定義されたポートフォワードを示します。

__Container Service__ タブを使ってコンテナの中で実行中のwebサーバに接続することができます。このタブはApacheのテストページを表示し、コンテナの中で実行されているhttpdデーモンにより提供されています。
