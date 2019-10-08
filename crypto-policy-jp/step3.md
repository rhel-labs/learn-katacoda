# サービスの問題に対応する

システム全体の暗号化ポリシーを変更したあと、新しいポリシーを適用するためにApacheサーバを再起動する必要があります。

> **NOTE:** Red Hat は新しい暗号化ポリシーを適用したあとのシステム全体の再起動を推奨しますが、この演習ではApache webサーバを個別に再起動します。

`systemctl restart httpd.service`{{execute T1}}

<pre class="file">
Job for httpd.service failed because the control process exited with error code.
See "systemctl status httpd.service" and "journalctl -xe" for details.
</pre>

Apacheの再起動に失敗しました。より具体的にはApacheのSSL errorログにエラーメッセージが出力されています。
以下のコマンドでエラーメッセージを確認し、このあとのステップで対処していきます。

`tail -2 /var/log/httpd/ssl_error_log`{{execute T1}}

<pre class="file">
[Tue Jul 16 15:13:25.580860 2019 ] [ssl:emerg] [pid 8869:tid 140233336588544] AH02562: Failed to configure certificate fe80::42:acff:fe11:b:443:0 (with chain), check /etc/pki/tls/certs/localhost.crt
[Tue Jul 16 15:13:25.580860 2019 ] [ssl:emerg] [pid 8869:tid 140233336588544] SSL Library Error: error: 140AB18F: SSL routines: SSL_CTX_use_certificate:ee key too small
</pre>

> **NOTE:** ログの日付、時刻、プロセスIDやその他のメタデータは異なるoとがあります。重要なのは後部にあるメッセージです。

このログデータから、Apacheが起動しない原因となるエラーは /etc/pki/tls/certs/localhost.crt ファイルにより起きていることがわかります。最初に環境を確認したステップを思いだすと、このファイルには 2048 bitの公開鍵を使った証明書が含まれていました。しかし現在は FUTURE ポリシーを適用しているので、証明書には 3072 bit 以上のRSA公開鍵が必要です。

システム全体の暗号化ポリシー FUTURE に対して、既存の証明書が利用する公開鍵の長さがポリシーに違反しているため、Apacheの起動に失敗しています。次のステップでは、この問題を解決します。
