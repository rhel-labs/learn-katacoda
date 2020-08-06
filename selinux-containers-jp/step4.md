# Udica による SELinux コンテナポリシーを検証する

コンテナ用にUdicaを使用して生成され、SELinuxによって強制されたポリシーを確認することができます。

SELinux ポリシーをクエリして、*/home* ディレクトリへのアクセスを許可するルールが適用されているか探します。

`sesearch -A -s my_container.process -t home_root_t -c dir -p read`{{execute T1}}

<pre class="file">
allow my_container.process home_root_t:dir { getattr ioctl lock open read search };
</pre>

*/home* ディレクトリへの読み込みアクセスを許可するallowルールが存在しています。

SELinux ポリシーをクエリして、*/var/spool/* ディレクトリへのアクセスを許可するルールが適用されているか探します。

`sesearch -A -s my_container.process -t var_spool_t -c dir -p read`{{execute T1}}

<pre class="file">
allow my_container.process var_spool_t:dir { add_name getattr ioctl lock open read remove_name searchwrite };
</pre>

*/var/spool* ディレクトリへの読み込みアクセスを許可するallowルールが存在しています。

コンテナホストで SELinux ポリシーを問い合わせて、ネットワークアクセスを確認します。

`sesearch -A -s my_container.process -t port_type -c tcp_socket`{{execute T1}}

<pre class="file">
allow my_container.process http_port_t:tcp_socket { name_bind name_connect recv_msg send_msg };
</pre>

TCP ポート 80 に関連付けられた SELinux のタイプを確認します。TCP ポート 80 は Apache がバインドするポートです。

`semanage port -l | grep -w "80"`{{execute T1}}
