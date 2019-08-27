# 更新された証明書でApacheサービスを起動する

システム全体の暗号化ポリシーに準拠した証明書を使って、Apacheサービスを起動しましょう。
サービスはポリシーに従っているので今度は問題なく起動するはずです。

`systemctl restart httpd.service`{{execute T1}}

Apacheサービスが起動していることを確認できます。

`systemctl status httpd.service --no-pager`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Active: active (running) since Wed 2019-07-17 09:54:40 EDT; 2s ago

<< OUTPUT ABRIDGED >>
</pre>

サービスが実行中(running)で、証明書が FUTURE 暗号化ポリシーに準拠していることがわかります。
Apacheサービスに接続して、クライアントブラウザに示される証明書を確認しましょう。

`openssl s_client -connect localhost:443 </dev/null 2>/dev/null | grep '^Server public key'`{{execute T1}}

<pre class="file">
Server public key is 3072 bit
</pre>
