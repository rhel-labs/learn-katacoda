__rhel8-httpd__ コンテナはbashシェルを含んでいます。
このステップではコンテナを対話的にデプロイします。この方法ではデプロイされたコンテナの中でコマンドを実行できます。
*Terminal 1* を使いましょう。

`podman run -it rhel8-httpd /bin/bash`{{execute T1}}

普通のbashプロンプトがあらわれます:
<pre class="file">
bash-4.4#
</pre>

*Terminal 1*で表示されているシェルは、ホストオペレーティングシステムではなく、コンテナの中で実行されています。
これを確認するため、マウントされているファイルシステムを見てみましょう:

`df -hP`{{execute T1}}

<pre class="file">
Filesystem      Size  Used Avail Use% Mounted on
overlay          17G  6.1G   11G  36% /
tmpfs            64M     0   64M   0% /dev
tmpfs           915M  9.8M  905M   2% /etc/hosts
shm              63M     0   63M   0% /dev/shm
tmpfs           915M     0  915M   0% /sys/fs/cgroup
tmpfs           915M     0  915M   0% /proc/acpi
tmpfs           915M     0  915M   0% /proc/scsi
tmpfs           915M     0  915M   0% /sys/firmware
</pre>

全てのファイルシステムがメモリベース(tmpfs, shm)か、コンテナイメージをもとにこのコンテナ用に作られたオーバレイ(overlay)であることがわかります。

*Terminal 2*に切りかえましょう。*Terminal 2*はホストシステムで動いています。このシェルで実行中のコンテナを確認します:

`podman ps -a`{{execute T2}}
<pre class="file">
CONTAINER ID  IMAGE                         COMMAND               CREATED         STATUS                    PORTS                   NAMES
df54b664f133  localhost/rhel8-httpd:latest  /bin/bash             34 seconds ago  Up 33 seconds ago                                 heuristic_cray
</pre>

__Note:__ CONTAINER ID と NAMES はそれぞれユニークなものが付与されるので、実際の出力とは異なります。
