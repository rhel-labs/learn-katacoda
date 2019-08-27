# SSL証明書を再生成する

システム全体の暗号化ポリシー FUTURE に対応するため、かわりの3072bit以上のRSA公開鍵を使うSSL証明書を作って置き換える必要があります。

SSL証明書を作成して更新する前に、既存の証明書をバックアップしましょう:

`cp /etc/pki/tls/private/localhost.key /etc/pki/tls/private/localhost.key.orig`{{execute T1}}

`cp /etc/pki/tls/certs/localhost.crt /etc/pki/tls/certs/localhost.crt.orig`{{execute T1}}

元の証明書のバックアップを作ったので、予期しないことが発生しても元に戻すことができます。
新しい交換用のSSL証明書と公開鍵を作ります。新しい証明書では3072bitのRSA公開鍵を使用します。

`openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:3072 -subj='/C=XX/O=Default' -keyout /etc/pki/tls/private/localhost.key -out /etc/pki/tls/certs/localhost.crt`{{execute T1}}

<pre class="file">
Generating a RSA private key
.......................................++++
....................+++
writing new private key to '/etc/pki/tls/private/localhost.key'
-----
</pre>

鍵の長さが3072bitであることを確認します。

`openssl x509 -in /etc/pki/tls/certs/localhost.crt -text | grep bit`{{execute T1}}

<pre class="file">
                RSA Public-Key: (3072 bit)
</pre>

これで、大きな公開鍵を利用した新しい証明書が作られました。これは FUTURE 暗号化ポリシーに適合しています。

> **NOTE:** Certificate Authority (CA)により発行された証明書を使うことが推奨されます。もし CAにより発行された証明書を使う場合には、Certificate Signature Request (CSR)を作成してCAに送る必要があります。CAにより署名された証明書を受けとったら配置し、証明書を参照している設定ファイルを更新します。
