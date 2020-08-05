# ソフトウェアのインストールと設定
SELinuxはシステム上で動作するプロセス/コンテナを分離し、権限昇格を利用した攻撃を緩和する技術です。Udica は、Red Hat がサポートするコンテナツール (Podman, Skopeo, Buildah など) ファミリーを補完する新しいツールで、顧客のコンテナ環境のセキュリティを向上させるのに役立ちます。

>_NOTE:_ このラボでは、SELinux の基本とコンテナの基礎を十分に理解していることを前提としています。

始める前に、Udica (コンテナ用の SELinux ポリシーを生成するツール) や setools-console (SELinux ポリシー分析を容易にするツールのセット) などのパッケージが必要です。このデモでは、コンテナランタイム関連のパッケージはすでにインストールされています。

このラボでは端末タブを2つ利用します。コンテナホスト上の端末 (*Terminal*) と、コンテナを実行する第2の端末 (*Terminal 2*) です。

コンテナホストに udica と setools-console パッケージをインストールします。

`yum install -y udica setools-console`{{execute T1}}

最新の RHEL8 UBI イメージを入手します
`podman pull registry.access.redhat.com/ubi8/ubi:latest`{{execute T1}}

利用可能なコンテナイメージを一覧表示するには、`podman` を用います。

`podman images`{{execute T1}}

ラボのインターフェースの「Terminal 2」タブで、podman を使ってコンテナランタイムを作成し、コンテナ内の /home へのアクセスをホストの /home に read-only で渡し、コンテナ内の /var/spool へのアクセスをホストの /var/spool に read-write で渡し、ホストのポート 80 をコンテナのポート 80 にトラフィックを渡すようにバインドします。

`CONTAINER=$(podman run -v /home:/home:ro -v /var/spool:/var/spool:rw -d -p 80:80 -it registry.access.redhat.com/ubi8/ubi)`{{execute T2}}

>_NOTE:_ ホームディレクトリは読み込み専用でマウントされ、/var/spool/ディレクトリは読み書き可能でマウントされています。

ラボのインターフェースの「Terminal」タブで、podman を使ってアプリケーションコンテナの状態を確認し、実行中のコンテナ ID を取得します。

`podman ps; CONTAINERID=$(podman ps | grep registry.access.redhat.com/ubi8/ubi:latest | cut -b 1-12)`{{execute T1}}

<pre class="file">
CONTAINER ID  IMAGE                         COMMAND               CREATED        STATUS           PORTS               NAMES
e47a11d3e2c5  registry.access.redhat.com/ubi8/ubi:latest  /bin/bash  3 seconds ago  Up 2 seconds ago0.0.0.0:80->80/tcp  naughty_golick
</pre>

SELinux を使用している場合、コンテナプロセスには 'container_t' というタイプが割り当てられます。実行中のコンテナに割り当てられた SELinux のタイプを確認します。

`ps -eZ | grep container_t`{{execute T1}}

<pre class="file">
system_u:system_r:container_t:s0:c182,c1016 25755 pts/0 00:00:00 bash
</pre>

Red Hat Enterprise Linux では、SELinux はデフォルトで強制モードで有効になっています。 システム上の `sestatus` の出力を調べることで確認できます。

`sestatus`{{execute T1}}

<pre class="file">
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   enforcing
<< OUTPUT ABRIDGED >>
</pre>
