# アプリケーションイメージをスクラッチから作成する

`httpd`をスクラッチコンテナに導入するには、ホストの `yum` に `installroot` オプションをつけてコンテナファイルシステムのマウントポイントを指定します。

> _NOTE:_ `releasever` と `module_platform_id` は、chroot環境には `yum`の設定ファイルが存在しないため必要です。

`yum install --installroot ${scratchmnt} httpd --releasever 8 --setopt=module_platform_id="platform:el8" -y`{{execute T1}}

<pre class="file">
Updating Subscription Management repositories.
Unable to read consumer identity
This system is not registered to Red Hat Subscription Management. You can use subscription-manager to register.
Red Hat Enterprise Linux 8 for x86_64 - AppStream (RPMs)               2.4 MB/s | 7.0 MB     00:02
Red Hat Enterprise Linux 8 for x86_64 - BaseOS (RPMs)                  1.3 MB/s | 3.7 MB     00:02
Red Hat Enterprise Linux 8 for x86_64 - Supplementary (RPMs)            23 kB/s |  78 kB     00:03
Last metadata expiration check: 0:00:01 ago on Fri 17 May 2019 03:41:34 PM EDT.
Dependencies resolved.
=======================================================================================================
 Package                 Arch   Version                         Repository                        Size
=======================================================================================================
Installing:
 httpd                   x86_64 2.4.37-11.module+el8.0.0+2969+90015743
                                                                rhel-8-for-x86_64-appstream-rpms 1.4 M

<< OUTPUT ABRIDGED >>

Complete!
</pre>

ベースイメージを使う場合より多くのパッケージが必要になりますが、`httpd`と`systemd`以外の `yum`などは含まれません。

コンテナ実行時にsystemdを使って`httpd`を起動するためenableします。コンテナのマウントポイントに対して`chroot`を使い、以下のようにします。

`chroot ${scratchmnt} systemctl enable httpd`{{execute T1}}

<pre class="file">
Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.
</pre>

コンテナイメージにコンテンツをデプロイするには、ホストの`cp`コマンドで作業用コンテナのマウントポイントへコピーします。

`cp index2.html ${scratchmnt}/var/www/html/index.html`{{execute T1}}

パッケージをインストールし、indexファイルを追加したら、ファイルシステムを `buildah unmount` サブコマンドでアンマウントします。

`buildah unmount working-container`{{execute T1}}

<pre class="file">
b0ace0c1867f080c790357dd0c606c6919c163c308065c2323d3ddc148740eb1
</pre>

Webサーバのポートを外に見せ、コンテナの実行時にsystemdを起動するよう、`buildah config` サブコマンドでメタデータを変更します。

`buildah config --port 80 --cmd "/usr/sbin/init" working-container`{{execute T1}}

これらの `buildah config` のオプションは、OCIFileの EXPOSE と CMD 命令に対応します。

> _NOTE:_  systemdをサービスの起動に使っているので、`--entrypoint` ではなく `--cmd` オプションを利用します。

作業用コンテナの内容が完成し、メタデータの更新が終わったら、`buildah commit` で作業用コンテナをアプリケーションイメージとして保存します。

`buildah commit working-container el-httpd2`{{execute T1}}

<pre class="file">
Getting image source signatures
Copying blob sha256:273497ce3451052db7cc333d8e90c259314f9cb8d6d4f7a5b865656f65c24083
 162.17 MiB / 162.17 MiB [==================================================] 6s
Copying config sha256:a3c678a7d7c63edbac6e57a86da11ff4d916c0734bcbea9cfd55ae2b515275b9
 308 B / 308 B [============================================================] 0s
Writing manifest to image destination
Storing signatures
a3c678a7d7c63edbac6e57a86da11ff4d916c0734bcbea9cfd55ae2b515275b9
</pre>

この例では、全ての操作がコンテナのファイルシステムに対して直接行われたため、1つのレイヤだけが作成されます。 `buildah commit` ステップはレイヤを必要とするタイミングで実行できるため、複数アプリケーションに共通するパッケージ群を入れた状態をレイヤとするようなことも可能です。
