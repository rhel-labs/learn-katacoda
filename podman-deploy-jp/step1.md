ターミナルセッションで、利用可能なコンテナイメージを見てみましょう。

`podman images`{{execute T1}}

<pre class=file>
REPOSITORY              TAG      IMAGE ID       CREATED        SIZE
localhost/rhel8-httpd   latest   c12e3720df7b   43 hours ago   499 MB

</pre>

ローカル(localhost)のリポジトリにはコンテナが1つ (__rhel8-httpd__) あります。
コンテナに更新が提供されている場合、 __latest__ とタグづけされたもの以外には __IMAGE ID__ を使う必要があります。
このリストではそのほかにディスク上のコンテナイメージのサイズもわかります。
