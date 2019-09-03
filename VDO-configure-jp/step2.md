VDOボリュームを作成するには未使用のブロックデバイスが必要です。このシナリオではテンポラリなループバックデバイスを作成して利用します。実デバイスに書き込まれるデータは /tmp 内の1ファイルとして保存されます。

ファイルを作成するためにtruncateコマンドを利用します。

`truncate -s 10g /tmp/vdo.trunc`{{execute}}

vdo.truncファイルを使ってループバックデバイスを作ります。losetupを使ってループバックデバイスとファイルを関連づけます。

`losetup  /dev/loop1 /tmp/vdo.trunc`{{execute}}

ループバックデバイスをlsblkで確認します。

`lsblk`{{execute}}

<pre class="file">
# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
loop1           7:1    0   10G  0 loop
sr0            11:0    1 1024M  0 rom
vda           252:0    0 39.1G  0 disk
├─vda1        252:1    0    1G  0 part /boot
└─vda2        252:2    0 38.1G  0 part
  ├─rhel-root 253:0    0 34.2G  0 lvm  /
  └─rhel-swap 253:1    0  3.9G  0 lvm  [SWAP]
</pre>

最初の行にあらわれる loop1 という名前のデバイスで、サイズは10GBあります。

