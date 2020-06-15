システムの観点から、`yum` がアップデートをする際に何が起きるか観察しましょう。*Terminal* とラベルがついた最初の端末で、以下を実行します:

`yum update -y`{{execute T1}}


`yum` が最初に行うことはリポジトリのメタデータを更新することです。Red Hat Content Delivery Network(CDN)からデータをダウンロードされ、*gethostlatency* 端末や *tcplife* 端末で動きがあります。これらのツールの出力を見ると、`yum update`がネットワーク接続を確立する様子をリアルタイムで観測できます。

以下のような出力が *gethostlatency* 端末で表示されます:

<pre class="file">
TIME      PID    COMM                  LATms HOST
08:45:23  75923  yum                    0.10 localhost
08:45:25  75924  yum                  375.39 subscription.rhsm.redhat.com
08:45:27  75926  yum                  109.50 subscription.rhsm.redhat.com
08:45:38  75927  yum                   10.23 cdn.redhat.com
08:45:39  75929  yum                   10.21 cdn.redhat.com
08:45:40  75931  yum                   10.18 cdn.redhat.com
</pre>


これは、`yum`が localhost, subscription.rhsm.redhat.com, cdn.redhat.com のIPアドレスを参照していることを示します。`gethostlatency` によりアプリケーションが通信しているホストを簡単に知ることができます。

また、 *cachestat* 端末を見ると、以下のような出力が表示されます:

<pre class="file">
    HITS   MISSES  DIRTIES  BUFFERS_MB  CACHED_MB
      14        0        0           0       1681
    2768        0        0           0       1699
     596        0        0           0       1700
    4143        0        0           0       1708
    3252        0        0           0       1698

<< 出力省略  >>
</pre>

これは、完全にキャッシュ上で操作をおこなっていて、この時点ではストレージへのアクセスを行う必要がないことを示しています。

`yum` がパッケージのダウンロードを終了したら *tcplife* 端末を見てください。以下のサンプルのような出力が表示されるはずです:

<pre class="file">
PID   COMM       LADDR           LPORT RADDR           RPORT TX_KB RX_KB MS
75963 yum        172.17.0.39     38054 2.16.30.83      443      23 138393 36375.04
75963 yum        172.17.0.39     38054 2.16.30.83      443      24 163378 36374.62
75963 yum        172.17.0.39     38054 2.16.30.83      443      22 163223 36374.69
</pre>


この出力は、`yum` がポート443、IPアドレス 2.16.30.83 へ接続を確立したことを示しています。さらにこのサンプル出力では、接続は 36375.04ミリ秒(または 36.37504秒)維持されました。これは`yum`がパッケージのダウンロードに費やした時間と関係しています。
