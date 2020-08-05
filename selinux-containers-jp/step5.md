# 実行中のコンテナを再検査

ラボのインターフェースの「Terminal 2」で、実行中のコンテナの中で bash シェルを実行します。

`podman exec -t -i $CONTAINER /bin/bash`{{execute T2}}

コンテナが */home* ディレクトリにアクセスできるかどうかを確認します。

`cd /home/; ls`{{execute T2}}

<pre class="file">
packer  rhel
</pre>

SELinux にこのアクションを許可するように指示する allow ルールがあるので、今回は成功します。

コンテナが */var/spool/* ディレクトリへの読み込みアクセスを持っているかどうかを確認します。

`cd /var/spool/; ls`{{execute T2}}

<pre class="file">
anacron  cron  lpd  mail  plymouth  rhsm  up2date
</pre>

同様に、SELinux にこのアクションを許可するように指示する allow ルールがあるので、これも成功します。

コンテナが /var/spool/ ディレクトリへの書き込みアクセス権を持っているかどうかを確認します。

`touch test; ls`{{execute T2}}

<pre class="file">
anacron  cron  lpd  mail  plymouth  rhsm  test  up2date
</pre>
 
コンテナ内に netcat (nc) パッケージをインストールし、ポートバインディングをテストします。

`yum install -y nc`{{execute T2}}

nc にコンテナ内の80番ポートをlistenさせ、5秒後にタイムアウトさせます。

`timeout 5s nc -lvvp 80`{{execute T2}}

<pre class="file">
Ncat: Version 7.70 ( https://nmap.org/ncat )
Ncat: Listening on :::80
Ncat: Listening on 0.0.0.0:80
</pre>

上記の出力から、netcatがポート80に接続してlistenすることができたことがわかります。SELinux にポート 80 でのこのネットワークアクションを許可するように指示する allow ルールがあるので、これは成功します。

コンテナ内のポート8080をリッスンするように nc に指示し、5秒後にタイムアウトします。

`timeout 5s nc -lvvp 8080`{{execute T2}}

<pre class="file">
Ncat: Version 7.70 ( https://nmap.org/ncat )
Ncat: bind to :::8080: Permission denied. QUITTING.
</pre>

上記の出力から、netcatがポート8090に接続してリッスンすることができなかったことがわかります。 SELinux にこの操作を許可するように指示しているallowルールが存在しないため、SELinux によってブロックされました。

