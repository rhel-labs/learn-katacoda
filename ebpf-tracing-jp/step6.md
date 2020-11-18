このラボでは、Red Hat Enterprise Linux 8 システムのホスト名解決、TCP 接続情報、ファイル操作 (リアルタイム)、ファイルシステムのレイテンシ、メモリキャッシュのリアルタイムのヒット/ミスを観察しました。Red Hat Enterprise Linux 8 の bcc-tools に同梱されているような eBPF を利用したツールは非常に強力で、カーネルやシステムに関する情報に素早くアクセスすることができます。

bcc-toolsが提供するツールの数を見てみましょう:

`ls -l /usr/share/bcc/tools | wc -l`{{execute T1}}

<pre class="file">
112
</pre>

上の例で数えた107のツールは、Pythonのスクリプトなので簡単に調べたり変更することができます:

`file /usr/share/bcc/tools/biolatency`{{execute T1}}

<pre class="file">
/usr/share/bcc/tools/biolatency: Python script, ASCII text executable
</pre>


bcc-tools パッケージに含まれる各ツールには、コンパイル後に bpf() システムコールを介してカーネルに渡され、データの収集と分析に使用される eBPF プログラムのコードである C 言語で書かれた部分が含まれています。Python スクリプトは、この eBPF プログラムの出力を読み込み、簡単なフォーマット処理や更なる処理をおこないます。
