*Terminal 1*に戻り、コンテナのシェルを終了します。

`exit`{{execute T1}}

対話的なコンテナのプロセスが終了すると、コンテナは実行を停止します。コンテナの一覧を見ることで確認できます:

`podman ps -a`{{execute T1}}

<pre class="file">
CONTAINER ID  IMAGE                         COMMAND    CREATED      STATUS                    PORTS  NAMES
df54b664f133  localhost/rhel8-httpd:latest  /bin/bash  2 hours ago  Exited (0) 5 seconds ago         heuristic_cray
</pre>

__STATUS__ の欄が Exited となっていることがわかります。

この状態のコンテナをレジュームすることもできますが、今回はもう使いません。システムから削除してしまいましょう。 __podman rm <CONTAINER ID>__ とします。以下のコマンドでは、各コンテナイメージに特有の CONTAINER ID を抜きだすbashスクリプトを使っています。

`podman rm $(podman ps -a | grep Exited | cut -d" " -f1)`{{execute T1}}

この削除操作の出力は、システムから削除されたコンテナの CONTAINER ID です。
