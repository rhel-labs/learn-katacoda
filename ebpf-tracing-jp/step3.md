サンプルワークロードの観測をはじめる前に、別の端末でさらに2つの bcc-tools を起動しましょう:

*filetop* 端末で `filetop` を実行する:

`/usr/share/bcc/tools/filetop`{{execute T4}}

*filetop* 端末では、以下の例のようなヘッダで毎秒更新されるtopのようなツールが動作します。

<pre class="file">
09:08:28 loadavg: 0.26 0.48 0.72 1/817 76893

TID    COMM           READS  WRITES R_Kb     W_Kb    T FILE
</pre>

これが表示されていれば、ツールが適切に動作していることがわかります。このツールは読み込み回数(READS)と書き込み回数(WRITES)、読み書きのサイズ(R_Kb, W_Kb)をそれぞれ追跡します。さらに、ファイルの種類(T)、ファイル名(FILE)、アクセス元のコマンド(COMM)を表示します。

*filetop* 端末ではアプリケーションがファイルにアクセスしている様子をリアルタイムで見ることができます。そのため頻繁に表示が変わります。


ここで *xfsslower* 端末で `xfsslower` ツールを実行します:

`/usr/share/bcc/tools/xfsslower`{{execute T5}}

*xfsslower* 端末では以下のようなヘッダが表示されて、ツールが動作していることがわかります:

<pre class="file">
Tracing XFS operations slower than 10 ms
TIME     COMM           PID    T BYTES   OFF_KB   LAT(ms) FILENAME
</pre>


*xfsslower* 端末では、サンプルワークロードの `yum update` を開始するまで何も出てこないかもしれません。パッケージのインストールがはじまると、10ms以上の時間がかかっている操作、レイテンシ(LAT(ミリ秒))、操作対象のファイル名(FILENAME)が表示されはじめます。このサンプルワークロードでは、仮想マシンのストレージの限界を越えてしまうので遅い操作のレポートのためこのツールでの基準である10msのスレッショルドを越えたレイテンシが発生します。

最後に、*cachestat* 端末で `cachestat` ツールを実行します。

`/usr/share/bcc/tools/cachestat`{{execute T6}}

*cachestat*端末に以下のヘッダが表示され、ツールが正しく実行されていることがわかります:

<pre class="file">
    HITS   MISSES  DIRTIES  BUFFERS_MB  CACHED_MB
</pre>

*cachestat* 端末では、リアルタイムにLinuxメモリキャッシュのヒット(HITS)とミスヒット(MISSES)を見ることができます。`yum update` ワークロードの最初の部分では、ほとんどミスヒットは0になるはずです。しかしパッケージのインストールがはじまると、ディスク上のファイルやシステムメモリ上に保存されていない他のデータと相互作業するため、ミスヒットが増加するのがわかるはずです。

いくつかのツールをセットアップしたので、 `bpftool`を使ってカーネルにロードしたものを確認しましょう:

`bpftool prog list`{{execute T1}}

以下のサンプルのような出力が表示されます:

<pre class="file">
1: kprobe  name do_entry  tag 8ac728a12cedba65  gpl
        loaded_at 2020-02-19T19:07:30-0500  uid 0
        xlated 2352B  jited 1408B  memlock 4096B
2: kprobe  name do_return  tag 6deef7357e7b4530  gpl
        loaded_at 2020-02-19T19:07:30-0500  uid 0
        xlated 64B  jited 61B  memlock 4096B
3: tracepoint  name sock__inet_sock  tag 6deef7357e7b4530  gpl
        loaded_at 2020-02-19T19:07:30-0500  uid 0
        xlated 64B  jited 61B  memlock 4096B

<< 出力省略 >>
</pre>

これは現在ロードされている全てのBPFプログラムを表示します。

これで、いくつかのeBPFによる観測ツールを実行している状態になりました。次のステップでは、`yum update` サンプルワークロードの観測をはじめます。
