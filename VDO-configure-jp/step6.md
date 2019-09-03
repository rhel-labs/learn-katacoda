Used が 4.0GB から 5.0GB に増え、Space saving は 4% であることがわかります。

dfの出力では1.8GBが利用されています。1GBはいま作成したファイルによるもの、800MBはファイルシステムのメタデータによるものです。

`df -h|grep vdo`{{execute}}

<pre class="file">
# df -h /dev/mapper/vdo1
/dev/mapper/vdo1       100G  1.8G   99G   2% /data
</pre>

ファイルシステム内で重複したデータを持たせてみましょう。4つのコピーを作成します。

`for i in 2 3 4 5; do echo "copy $i";cp file.1 file.$i; done`{{execute}}
