次に、`yum` は更新をインストールし、古いパッケージを削除します。これを行うために `yum` はディスクとメモリ資源を利用します。これを `filetop`, `xfsslower`, `cachestat`で観察しましょう。

*filetop* 端末では、ディスクからの読み書きがおこなわれているのを見られます。 `yum` がrpmパッケージからファイルを読みだし、ディスクへ書き出します。以下はファイル読み込み操作の例です:

<pre class="file">
TID    COMM             READS  WRITES R_Kb    W_Kb    T FILE
77699  yum              7      0      2       0       R stat.h;5e5574b8
77699  yum              3      0      0       0       R tc_defact.h;5.5574b8
77699  yum              1      0      0       0       R rpmsg.h;5e5574b8
77699  yum              2      0      0       0       R midi.h;5e5574b8
<< OUTPUT ABRIDGED >>
</pre>

この出力では、Typeカラム(T)は通常のファイル(R)であることがわかります。READSカラムのカウンタが0でないので読みだしを行っていることもわかります。これにより、システム上のファイルに対して`yum`が何をしているのかリアルタイムでわかります。

さらに、 *xfsslower* 端末では、XFSの操作が 10msのしきい値より長くなり、ディスクへの操作が表示されはじめます:

<pre class="file">
Tracing XFS operations slower than 10 ms
TIME     COMM           PID    T BYTES   OFF_KB   LAT(ms) FILENAME
09:22:58 b'yum'         77726  S 0       0         567.45 b'packages.db-journal'
09:22:58 b'yum'         77726  S 0       0          14.21 b'packages.db-journal'
09:22:58 b'yum'         77726  S 0       0          14.48 b'packages.db-journal'
09:22:58 b'yum'         77726  S 0       0          13.83 b'packages.db-journal'
09:22:58 b'yum'         77726  S 0       0          14.16 b'packages.db-journal'
09:22:59 b'yum'         77726  S 0       0          10.07 b'packages.db-journal'
09:22:59 b'yum'         77726  S 0       0          27.65 b'packages.db'
<< OUTPUT ABRIDGED >>
</pre>


上の出力では、`yum` が作業しているファイルとレイテンシ(LAT(ms)カラム)が表示されています。このデータでは最長のレイテンシは 567.45 ミリ秒で packages.db-journal というファイルへアクセスしています。もしこのシステムでレイテンシを下げて `yum update` の速度を向上させたい場合、このシステムの基盤となっているストレージをアップグレードすることを検討します。

*cachestat* 端末を見ると、 `yum` パッケージのインストール操作の間は、キャッシュされていないデータへのアクセスを必要とするため、キャッシュのミス回数が増えていることがわかります:

<pre class="file">
    HITS   MISSES  DIRTIES  BUFFERS_MB  CACHED_MB
       0       62        0           0       1701
       0       52        0           0       1702
      45        2        0           0       1701
    5721     3777        0           0       1716
   18683     6606        0           0       1747
   14853     6223        0           0       1778
       0        2        0           0       1778

<< OUTPUT ABRIDGED >>
</pre>


*cachestat* 端末を見続けていると、 `yum update` が完了するとミスの数が0に戻ることに気がつくでしょう。これは `yum update` が完了すると仮想マシンはアイドル状態にもどり、ストレージへのアクセスを必要とする処理はほとんど行われなくなるためです。
