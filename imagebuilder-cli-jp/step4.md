# イメージの検査

このステップでは、前のステップで作成したマシンイメージにアクセスして、その前のステップで追加した `nodejs` パッケージがマシンイメージに追加されていることを確認します。

次のステップでマシンイメージにアクセスしますが、マシンイメージがまだ完成していない場合は動作しません。 以下のコマンドは小さな `until` シェルスクリプトで、マシンイメージが作成が完了するまで実行されます。

`until $(composer-cli compose status | head -n1 | grep FINISHED &>/dev/null); do echo "Compose not finished ... waiting 10 seconds"; sleep 10; done; echo "COMPOSE FINISHED"`{{execute}}

これでマシンイメージの作成が完了したので、完成したマシンイメージをカレントディレクトリにダウンロードします。

`composer-cli compose image $(composer-cli compose status | head -n1 | cut -f1 -d" ")`{{execute}}

<pre class="file">
78915164-320d-4fc3-88d4-91fc40e5f0c8-filesystem.img: 2585.00 MB
</pre>

上のコマンドは、引数に イメージ作成 の UUID を受け取ります。 UUIDを入力するため、実行するコマンドの中にデータの切り出しと一緒に `composer-cli compose status` の呼び出しを埋め込んでいます。 あるいは、前のステップのステータスの出力をコピー/ペーストしても構いません。

マシンイメージが利用可能になったので、ディスクイメージをディレクトリツリーの /mnt マウントポイントにマウントします。

`mount -o loop $(composer-cli compose status | head -n1 | cut -f1 -d" ")-filesystem.img /mnt`{{execute}}

前のステップでは、ext4-filesystem タイプのイメージを構築することを選択しました。 別の出力タイプを選択した場合、マシンイメージの内容にアクセスするために qemu-img などの他のユーティリティを使用する必要があるかもしれません。 マシンイメージファイルには イメージ作成トランザクションの UUID が含まれていたので、上記のコマンドを 'クリック可能' にしたままプログラム的にそのデータを取得するため、少し埋め込みコマンドの実行を追加しました。

bash シェルのルートディレクトリを、マシンイメージの内容を保持するディレクトリへ一時的に変更します。

`chroot /mnt`{{execute}}

これで、実行されるコマンドはすべてマシンイメージ内から実行され、マシンイメージのファイルとコンテンツを使用します。 マシンイメージに `nodejs` が含まれていることを確認するには、`rpm` クエリを使ってください。

`rpm -q nodejs`{{execute}}

<pre class="file">
nodejs-10.21.0-3.module+el8.2.0+7071+d2377ea3.x86_64
</pre>


上記の出力から、`nodejs`がこのマシンイメージにインストールされていることが確認できます。

検証が完了したので、chroot化されたbashシェルを終了します。

`exit`{{execute}}}。

検証済みのマシンディスクイメージをファイルシステムからアンマウントします。

`umount /mnt`{{execute}}} を実行します。

