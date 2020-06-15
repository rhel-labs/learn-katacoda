
このステップでは、システムのアクティブなワークロードを観察する準備として、 bcc-tools を実行しはじめます。ラボ環境のインタフェース上部にはいくつかの端末タブがあり、それぞれこのステップと次のステップで実行するツールに対応した名前がついています。

しかしまずは、現在この環境で eBPFを利用していないことを確認します。このために `bpftool` ユーティリティをインストールします。

`yum install -y bpftool`{{execute T1}}


次に、`bpftool` を実行して eBPFプログラムが現在カーネルにロードされていないことを確認します。使用中のeBPFプログラムがない場合、ツールは何も出力しません。

`bpftool prog list`{{execute T1}}

ツールは出力をしないはずで、この環境でeBPFを使うツールが使われていないことを示しています。

ここで、別の端末で bcc-tools アプリケーションをいくつか起動しましょう。これらを使ってあとのステップでサンプルワークロードを観測します。

*gethostlatency* 端末で `gethostlatency` を実行する:

`/usr/share/bcc/tools/gethostlatency`{{execute T2}}

*gethostlatency* 端末には以下のようなヘッダが表示され、ツールが動作していることがわかります。

<pre class="file">
TIME      PID    COMM                  LATms HOST
</pre>


*gethostlatency* 端末で、`gethostlatency` bcc-toolを実行しています。これはシステムコール `getaddrinfo()` および `gethostbyname()` の待ち時間を表示しています。実質的に、これらのシステムコールがどのくらい時間がかかったかと、アプリケーションがどのホスト名に対応するIPアドレスを問いあわせたかがわかります。これはアプリケーションが行っているネットワーク接続を検出するために利用できます。

次に、 *tcplife* 端末で `tcplife` を実行します。

`/usr/share/bcc/tools/tcplife`{{execute T3}}

*tcplife* 端末には以下のヘッダが表示され、ツールが動作していることがわかります:

<pre class="file">
PID   COMM       LADDR           LPORT RADDR           RPORT TX_KB RX_KB MS
</pre>

`tcplife`は確立されたTCP接続に関するデータを提供します。PIDは接続を開いたプロセスのプロセスID、 COMMはPIDに対応するコマンド、LADDRとLPORTはローカルアドレスとポート、RADDRとRPORTはリモートアドレスとポートです。
TX_KB と RX_KB はそれぞれ送信量(キロバイト)と受信量(キロバイト)です。MSは接続していた時間(ミリ秒)です。


次のステップでは、追加のデータ収集を開始するため、さらに bcc-tools アプリケーションを起動します。
