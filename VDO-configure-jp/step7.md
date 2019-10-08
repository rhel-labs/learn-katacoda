syncコマンドを実行して全データをファイルシステムのページキャッシュからVDOへ掃き出します。

`sync`{{execute}}

df -h と vdostats の出力を参照し、スペースの節約を確認します。

`df -h /dev/mapper/vdo1`{{execute}}

<pre class="file">
# df -h|grep vdo
/dev/mapper/vdo1       100G  5.7G   95G   6% /data
</pre>

dfでは、1GBのファイルを5つ作成したことで5.7GBが消費されていることがわかります。

vdostatsを見てみましょう。

`vdostats --human-readable`{{execute}}

<pre class="file">
# vdostats --human-readable
Device                    Size      Used Available Use% Space saving%
/dev/mapper/vdo1         10.0G      5.0G      5.0G  49%           80%
</pre>

Used の量は最初のファイルを作成したときから変わらず、Space saving が 80% になっています!
