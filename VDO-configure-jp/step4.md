スペースの節約を行うデモンストレーションのため、VDOボリュームをXFSでフォーマットします。

`mkfs.xfs -K /dev/mapper/vdo1`{{execute}}

"-K"オプションを指定することで、mkfsがフォーマット時にVDOに対してブロックの破棄(discard)を指示しなくなります。

新しいファイルシステムをマウントするためのディレクトリを作ります。

`mkdir /data`{{execute}}

ファイルシステムをマウントします。

`mount -o discard /dev/mapper/vdo1 /data`{{execute}}

"-o discard" オプションにより、ファイルシステムはファイルが削除されるとシンプロビジョニングレイヤへブロックの破棄(discard)を送ります。ブロックの破棄はスペースの節約を精確にレポートするために必要です。
