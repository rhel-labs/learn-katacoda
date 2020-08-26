# ブループリントを編集する

このステップでは、マシンイメージの構築に使用される既存のブループリントを使用して、追加のパッケージを含むように更新します。

まず、システム上で利用可能なブループリントを見てみましょう。

`composer-cli blueprints list`{{execute}}

<pre class='file'>
example-atlas
example-development
example-http-server
</pre>

このシステムには、前のステップでインストールした `lorax-composer` パッケージに含まれる 3 つのサンプルのブループリントがあります。 このラボでは __example-http-server__ のブループリントを使用します。

ブループリントを変更するには、まずブループリントのコピーを保存します。 `composer-cli` は、マシンイメージを作成するために使用される example-http-server ブループリントの現在の状態を、TOML (Tom's Obvious Minimal Language) フォーマットのファイルとして出力します。

`composer-cli blueprints save example-http-server`{{execute}}

興味があれば、`cat` や `less` などのツールを使って、作業ディレクトリにある __example-http-server.toml__ ファイルを見てみてください。

`nodejs` をexample-http-serverのブループリントに含まれるソフトウェアのリストに追加してみましょう。 `nodejs` はRed Hat Enterprise Linuxのアプリケーションストリームとして配布されているので、example-http-server.toml ファイルに __[[modules]]__ セクションを追加して、`nodejs` を追加します。

`printf '\n[[modules]]\nname = "nodejs"\nversion = "*"' >> example-http-server.toml`{{execute}}

このコマンド `printf` は以下のようにフォーマットされる節を example-http-server.toml ファイルに追加します:

<pre class='file'>

[[modules]]
name = "nodejs"
version = "*"
</pre>

次に、ローカルの example-http-server.toml ファイルに保存されているバージョンを使用するよう example-http-server ブループリントの定義を更新します。この更新した定義を lorax-composer バックエンドにプッシュします。

`composer-cli blueprints push example-http-server.toml`{{execute}}

更新が行われたことを確認するため、 example-http-server ブループリントの更新ログを見ます。

`composer-cli blueprints changes example-http-server`{{execute}}

<pre class='file'>
example-http-server
    2020-07-13T23:07:57Z  e4284083bad43ded8a4a9ea2947a5f45be72f8c4
    Recipe example-http-server, version 0.0.2 saved.

<<< 出力省略 >>>
</pre>

上の出力から、 example-http-server ブループリントがついさきほど更新されたことがわかります。

>**Note:** 上のコマンド出力と、アウトプット例の日時は異なります。

また、example-http-serverのブループリントの内容を確認して、`nodejs`モジュールのエントリがブループリント命令のアクティブバージョンに反映されていることを確認することもできます。

`composer-cli blueprints show example-http-server`{{execute}}

<pre class='file'>
name = "example-http-server"
description = "An example http server with PHP and MySQL support."
version = "0.0.2"
groups = []

[[modules]]
name = "httpd"
version = "2.4.*"

[[modules]]
name = "mod_ssl"
version = "2.4.*"

[[modules]]
name = "nodejs"
version = "*"

<<< 出力省略 >>>
</pre>

上記の出力で、`nodejs` モジュールの定義が example-http-server ブループリントに含まれていることがわかります。