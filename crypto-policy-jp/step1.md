# 環境を確認する
このターミナルセッションで、初期の環境を確認します。

まず、現在のシステム全体の暗号化ポリシーを確認しましょう。

`update-crypto-policies --show`{{execute T1}}

<pre class="file">
DEFAULT
</pre>

Red Hat Enterprise Linuxのデフォルトのシステム全体の暗号化ポリシー(cryptographic policyまたはcrypto policy)は `DEFAULT` です。

Secure Socket Layer (SSL)は暗号化ポリシーで管理される暗号化手法のひとつです。この演習では、ApacheがSSLを利用してサービスを行います。SSL をどう管理するかが変更されると、その暗号化フレームワークを利用するサービスに影響する可能性があります。

マシンでApacheが動作していることを確認しましょう。

`systemctl status httpd.service --no-pager`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Active: active (running) since Monday 2019-07-15 19:24:18 EDT; 3h 59min left

<< OUTPUT ABRIDGED >>
</pre>

現在の状態が __active (running)__ であることを確認します。

デフォルトでは、Apacheは /etc/pki/tls/certs/localhost.crt に自動的に生成される自己署名証明書を利用します。この証明書ファイルで使われているRSA公開鍵の長さを確認しましょう。

`openssl x509 -in /etc/pki/tls/certs/localhost.crt -text | grep bit`{{execute T1}}

<pre class="file">
                RSA Public-Key: (2048 bit)
</pre>

デフォルトでは、Apacheは2048 bitの公開鍵を利用した証明書を使っていることがわかります。

`openssl` を使ってApacheのhttpsポート(443)に接続してみましょう。この接続をする中で、opensslはサービスとの通信を暗号化するために証明書のコピーを受けとります。上で見た2048 bitの公開鍵を使う証明書がクライアント(webブラウザなど)でも使われることを確認できます。

`openssl s_client -connect localhost:443 </dev/null 2>/dev/null | grep '^Server public key'`{{execute T1}}

<pre class="file">
Server public key is 2048 bit
</pre>

クライアントは 2048 bitの公開鍵と証明書をApacheサービスから受けとり、暗号化に利用します。
