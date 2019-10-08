# システム全体の暗号化ポリシーを FUTURE に設定する

ある日、CSO (Chief Security Officer)が以下のメールを遅ります:
<pre class="file">
アプリケーションおよびインフラストラクチャ管理者各位、

先日参加したセキュリティカンファレンスで、アプリケーションとサービスに適用されるセキュリティ業界の推奨を学びました。具体的には、安全性の低い暗号化アルゴリズムを無効にし、他の暗号化アルゴリズムについて最小強度を強制する必要があります。

RSAベースの証明書を介して非対称暗号化を利用するアプリケーションおよびサービスでは、証明書に少なくとも3072ビットの公開鍵を使用する必要があります。

TLS接続は、TLSバージョン1.2以降のみを提供します。 TLS 1.0および1.1は、サービスまたはアプリケーションへの暗号化された接続には使用すべきではありません。

アプリケーションとサービスは、デジタル署名にSHA1を使用しないよう設定する必要があります。

これらの変更によりクライアントのデータをインターネット経由で転送する場合より安全になります。

-CSO
</pre>

これらの要件は Red Hat Enterprise Linux のシステム全体の暗号化ポリシーで設定できます。
新しい組織のポリシーに従うには、システムで **FUTURE** 暗号化ポリシーを利用するよう更新します。
**FUTURE** へ変更することで、システムで利用する暗号化ライブラリ、サービス、およびアプリケーションを上のメールで CSO が指定した要件に適合させます。

`update-crypto-policies --set FUTURE`{{execute T1}}

<pre class="file">
Setting system policy to FUTURE
Note: System-wide crypto policies are applied on application start-up.
It is recommended to restart the system for the change to policies
to fully take place.
</pre>

この変更により、デジタル署名へのSHA1の利用など、いくつかの暗号化アルゴリズムは許可されなくなります。さらにRSAベースの証明書は3072 bit以上の公開鍵を必要とします。このシステムはTLS接続について、TLS 1.2以上のみを受けつけます。

以下のコマンドで新しいポリシーの FUTURE が適用されていることを確認できます。

`update-crypto-policies --show`{{execute T1}}

<pre class="file">
FUTURE
</pre>

Red Hat Enterprise Linux 8 で出荷されている暗号化ポリシーについてより詳細を知りたい場合は:

`man crypto-policies`{{execute T1}}
