# イメージ作成のトラブルシューティング

マシンイメージのビルドがうまくいかないことがあります。 ビルドのログを見ると、トラブルシューティングに役立つかもしれません。

`composer-cli compose log $(composer-cli compose status | head -n1 | cut -f1 -d" ")`{{execute}}

ラボでは、コマンド出力や、個々のマシンイメージ操作を処理する際の引数としてイメージ作成トランザクションの UUID が使用されているのを見てきました。 lorax-composer のバックエンドもまた、この UUID を使用して、特定のマシンイメージのビルドに関するデータを保存します。 すべてのマシンイメージビルドの結果は `/var/lib/lorax/composer/results` に格納されます。

ラボで完了したマシンイメージビルドに関連するデータを見るには、以下のようにします:

`ls /var/lib/lorax/composer/results/$(composer-cli compose status | head -n1 | cut -f1 -d" ")`{{execute}}

<pre class="file">
blueprint.toml  config.toml  ext4-filesystem.ks  final-kickstart.ks  logs    times.toml
COMMIT          deps.toml    filesystem.img      frozen.toml         STATUS
</pre>

このディレクトリには、キックスタートの命令、ログ、状態、結果として作成されたイメージが含まれています。 これらのファイルの多くは、これまでのステップで `composer-cli` コマンドを使って操作しています。
