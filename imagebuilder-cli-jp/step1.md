# 必要なソフトウェアのインストールと有効化

Image Builderでイメージの構築を開始する前に、必要なソフトウェアをシステムにインストールしておく必要があります。 具体的には、`composer-cli` コマンドを提供する `composer-cli` パッケージと、仮想マシンイメージを生成するためのバックエンドサービスを提供する `lorax-composer` パッケージです。

`yum -y install composer-cli lorax-composer`{{execute}}

<pre class='file'>
<< 出力省略 >>>

==========================================================================================================================================
 Package                            Arch      Version                                           Repository                           Size
==========================================================================================================================================
Installing:
 composer-cli                       x86_64    28.14.42-2.el8_2                                  rhel-8-for-x86_64-appstream-rpms     84 k
 lorax-composer                     x86_64    28.14.42-2.el8_2                                  rhel-8-for-x86_64-appstream-rpms    155 k
Installing dependencies:
 anaconda-core                      x86_64    29.19.2.17-1.el8                                  rhel-8-for-x86_64-appstream-rpms    2.2 M

<<< 出力省略 >>>

Complete!
</pre>

ソフトウェアがシステムに正常にインストールされたので、`lorax-composer` サービスを有効にする必要があります。`composer-cli` コマンドはこのサービスと対話してキューイングやマシンイメージの作成を依頼します。

`systemctl enable --now lorax-composer.service`{{execute}}

<pre class='file'>
Created symlink /etc/systemd/system/multi-user.target.wants/lorax-composer.service → /usr/lib/systemd/system/lorax-composer.service.
</pre>

これでサービスが有効になったので、Image Builderアプリケーションを使ってマシンイメージを作成する準備が整いました。
