VDOボリュームを作成する

VDOはシンプロビジョニングをスペース節約のために利用します。重複排除では同じ内容をもつ複数の論理的なブロックを、同一の物理的なブロックに対応づけます。そのためVDOはファイルシステムに対して物理的なサイズより大きなデバイスを提示します。

この例ではVDOボリュームのサイズを /dev/loop1 の10倍のサイズである100GBとします。

`vdo create --name=vdo1 --device=/dev/loop1 --vdoLogicalSize=100G`{{execute}}

<pre class="file">
# vdo create --name=vdo1 --device=/dev/loop1 --vdoLogicalSize=100G
Creating VDO vdo1
Starting VDO vdo1
Starting compression on VDO vdo1
VDO instance 1 volume is ready at /dev/mapper/vdo1
</pre>

VDOボリュームは /dev/mapper/vdo1 に作成されました。vdostats --human-readable を使ってボリュームを見てみましょう。

`vdostats --human-readable`{{execute}}

<pre class=”file”>
# vdostats --human-readable
Device                    Size      Used Available Use% Space saving%
/dev/mapper/vdo1         10.0G      4.0G      6.0G  40%            0%
</pre>

このボリュームでは節約されたスペースが 0% で、4GB利用済みです。これはメタデータのために確保されるスペースです。
