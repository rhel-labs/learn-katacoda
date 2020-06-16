# Kernel Live Patch を確認する

Kernel Live Patch が正しく適用されたことを確認するため、最初のステップで実行した `kpatch list` コマンド を実行します。今回は出力が空欄ではありません。

`kpatch list`{{execute}}

<pre class="file">
Loaded patch modules:
kpatch_4_18_0_193_1_2 [enabled]

Installed patch modules:
kpatch_4_18_0_193_1_2 (4.18.0-193.el8.x86_64)
</pre>

この出力から、前のステップでインストールしたkpatchはシステムへ適用され、有効化されていることがわかります。これでシステムは実行中のカーネルに対してクリティカルなCVEを解決するための更新されました。

次のステップでは、適用されたkpatchでどのCVEが解決されたのか、そしてCVEおよびその緩和策について、Red Hatの追加情報がどこにあるか見ます。
