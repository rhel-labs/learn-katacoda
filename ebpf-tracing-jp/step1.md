eBPFはカーネル内の仮想マシンです。カーネル空間の中の、制限された関数群だけにアクセス制限されたサンドボックス環境でコード実行ができます。この仮想マシンは特殊なアセンブリのようなコードを実行します。このコードはカーネルに読み込まれるとネイティブな機械語にJust in timeコンパイラで変換されます。Red HatはeBPF仮想マシンを利用した多くのコンポーネントを出荷しています。

bcc-toolsパッケージは eBPFの機能を利用してデータを提供する多くのツールを提供しています。

まず、現在実行している kernel に対応する kernel-devel パッケージと、bcc-toolsパッケージをインストールします。

`yum install -y kernel-devel-$(uname -r) bcc-tools`{{execute T1}}

>**Note:** 上記のコマンドでは、 `uname -r` コマンドを埋めこむことで、現在実行中のカーネルのバージョンを自動的に取得しています。

次に、 bcc-tools パッケージの中身を確認して、いくつかのツールを見てみましょう。それぞれのツールには `man` ページがあり、ツールが生成するデータの詳細や、指定できるオプションを説明されています。

`rpm -ql bcc-tools | grep /usr/share/bcc/tools/`{{execute T1}}

<pre class="file">
/usr/share/bcc/tools/argdist
/usr/share/bcc/tools/bashreadline
/usr/share/bcc/tools/biolatency
/usr/share/bcc/tools/biosnoop

<< 出力省略 >>
</pre>

次のステップでは、これらツールのいくつかを使って作業することになります。bcc-toolsパッケージで提供されるツールは /usr/share/bcc/tools ディレクトリにインストールされます。


