# コンテナアクセスとSELinuxポリシーの検査

ラボのインターフェイスの「Terminal 2」タブで、`podman exec` コマンドを使って実行中のコンテナ内で対話型シェルを動かします。

`podman exec -t -i $CONTAINER /bin/bash`{{execute T2}}

コンテナの */home* ディレクトリへのアクセスを確認します。

`cd /home; ls`{{execute T2}}

<pre class="file">
ls: cannot open directory '.': Permission denied
</pre>

ラボインターフェイスの「Terminal」タブで、SELinux ポリシーをクエリして、*/home* ディレクトリへのアクセスを許可するルールが適用されているか探します。

`sesearch -A -s container_t -t home_root_t -c dir -p read`{{execute T1}}

このクエリは結果を返しません。container_t型には、*/home*ディレクトリへの読み込みアクセスを許可するルールがないので、アクセスが SELinux によってブロックされていることがわかります。

ラボインターフェイスの 「Terminal」 タブで、コンテナから */var/spool/* ディレクトリへのアクセスを確認します。

`cd /var/spool/; ls`{{execute T2}}

<pre class="file">
ls: cannot open directory '.': Permission denied
</pre>

SELinux が */var/spool* ディレクトリへのアクセスを制限しています。

ラボインタフェースの「Terminal 2」タブで、コンテナから */var/spool/* ディレクトリへの書き込みアクセスを確認します。

In 'Terminal 2' tab of the lab interface, check the container's write access to the */var/spool/* directory

`touch test`{{execute T2}}

<pre class="file">
touch: cannot touch 'test': Permission denied
</pre>

ラボインターフェイスの「Terminal」タブで、SELinux ポリシーをクエリして、 */var/spool* ディレクトリへのアクセスを許可するルールが適用されているか探します。

`sesearch -A -s container_t -t var_spool_t -c dir -p read`{{execute T1}}

このクエリは結果を返しません。container_t型には、*/var/spool/*ディレクトリへの読み込みアクセスを許可するルールがないので、アクセスが SELinux によってブロックされていることがわかります。

SELinuxポリシーを問いあわせて、container_t タイプのネットワークへのアクセスのポリシーを確認します。

`sesearch -A -s container_t -t port_type -c tcp_socket`{{execute T1}}

<pre class="file">
allow container_net_domain port_type:tcp_socket { name_bind name_connect recv_msg send_msg };
allow corenet_unconfined_type port_type:tcp_socket { name_bind name_connect recv_msg send_msg };
allow sandbox_net_domain port_type:tcp_socket { name_bind name_connect recv_msg send_msg };
</pre>


sandbox はSELinuxのデフォルトのプロセスタイプ(ドメイン)であり、containerはコンテナのコンテキストで使用されるドメインです。corenetタイプは、通常、Linuxカーネルのコンテキストで使用されます。この出力は、これらのドメインのそれぞれについて、TCP ポートの制限なく、バインディング、接続、メッセージの送受信が許可されていることを意味します。
