/data ディレクトリに移動してファイルシステムを使います。

`cd /data`{{execute}}

重複排除によるストレージコスト削減の効果を見るため、ランダムなデータを含むファイルを1つ作り、いくつか複製を作ります。

このddコマンドで1GBのランダムな内容のファイルを作ります。

`dd if=/dev/urandom of=/data/file.1 bs=1M count=1000`{{execute}}

ファイルが作成されたら、vdostatsの出力を確認します。

`vdostats --human-readable`{{execute}}

<pre class="file">
# vdostats --human-readable
Device                    Size      Used Available Use% Space saving%
/dev/mapper/vdo1         10.0G      5.0G      5.0G  49%            4%
</pre>

Note: ランダムデータを書くことで "Used" の値が書いた量ほぼそのまま増えています。ランダムなため重複排除ができず、スペースの節約もわずかです。
