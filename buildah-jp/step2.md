# 既存のベースイメージからアプリケーションイメージを作成する

`ubi-init` イメージには `yum` や `systemd` などのツールが含まれ内容が充実しています。`buildah run` サブコマンドを使い、 `yum` で `httpd` をコンテナにインストールすることができます。

`buildah run ubi-init-working-container -- yum -y install httpd`{{execute T1}}

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

<< 出力を省略 >>

Complete!
</pre>

このサブコマンドは OCIFile の RUN命令のように動きます。 `yum` コマンドにスイッチがあるため、`--` を入れて `buildah run` にこれより後ではbuildahのオプションを探さないよう指示します。

作業用コンテナにパッケージをインストールしたら、`httpd` がコンテナ起動時に実行されるよう `buildah run` サブコマンドを使って `httpd` サービスをenableします。

`buildah run ubi-init-working-container -- systemctl enable httpd`{{execute T1}}

<pre class="file">
Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.
</pre>

Webコンテンツをコンテナイメージにデプロイするには `buildah copy` サブコマンドを利用します。

`buildah copy ubi-init-working-container index1.html /var/www/html/index.html`{{execute T1}}

このサブコマンドは OCIFile の COPY 命令のように動作します。

Webサーバのポートを外に見せ、コンテナの実行時にsystemdを起動するよう、`buildah config` サブコマンドでメタデータを変更します。

`buildah config --port 80 --cmd "/usr/sbin/init" ubi-init-working-container`{{execute T1}}

これらの `buildah config` のオプションは、OCIFileの EXPOSE と CMD 命令に対応します。

> _NOTE:_  systemdをサービスの起動に使っているので、`--entrypoint` ではなく `--cmd` オプションを利用します。

作業用コンテナの内容が完成し、メタデータの更新が終わったら、`buildah commit` で作業用コンテナをアプリケーションイメージとして保存します。

`buildah commit ubi-init-working-container el-httpd1`{{execute T1}}

<pre class="file">
Getting image source signatures
Skipping fetch of repeat blob sha256:24d85c895b6b870f6b84327a5e31aa567a5d30588de0a0bdd9a669ec5012339c
Skipping fetch of repeat blob sha256:c613b100be1645941fded703dd6037e5aba7c9388fd1fcb37c2f9f73bc438126
Skipping fetch of repeat blob sha256:188ab351dfda8afc656a38073df0004cdc5196fd5572960ff5499c17e6442223
Copying blob sha256:8df24355b15ad293a5dd60d0fe2c14dca68b0412b62f9e9c39c15bb8230d1936
 26.80 MiB / 26.80 MiB [====================================================] 0s
Copying config sha256:b04fe2c73b034e657da2fee64c340c56086a38265777556fa8a02c5f12896e66
 2.42 KiB / 2.42 KiB [======================================================] 0s
Writing manifest to image destination
Storing signatures
b04fe2c73b034e657da2fee64c340c56086a38265777556fa8a02c5f12896e66
</pre>

この例では、OCIFileを使ってビルドするときのようにそれぞれの`buildah`のサブコマンドでレイヤが作成されます。

