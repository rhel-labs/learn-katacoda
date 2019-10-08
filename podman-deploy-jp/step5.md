対話的なコンテナと異なり、非対話的なコンテナは  __podman stop <CONTAINER ID>__ で停止します。

`podman stop $(podman ps -a | grep Up | cut -d" " -f1)`{{execute T1}}

上のコマンドでは、コンテナに特有の __CONTAINER ID__ を抜きだすbashスクリプトを使っています。

コンテナが終了していることを確認しましょう:

`podman ps -a`{{execute T1}}

<pre class="file">
CONTAINER ID  IMAGE                         COMMAND               CREATED        STATUS                     PORTS                   NAMES
2b2571efec6f  localhost/rhel8-httpd:latest  /usr/sbin/httpd -...  9 minutes ago  Exited (0) 50 seconds ago  127.0.0.1:8081->80/tcp  priceless_mahavira
</pre>

コンテナが提供していたApache webサーバが既に存在しませんので、__Container Service__ タブを見ると、接続できない旨が表示されます。
