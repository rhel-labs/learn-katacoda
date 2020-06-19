# ソフトウェアのインストールと設定
Image Builderを使う前に、まずソフトウェアをインストールする必要があります。
必要なパッケージは、Image BuilderとWeb Consoleのプラグインです。

`yum install -y cockpit-composer lorax-composer composer-cli`{{execute}}

ソフトウェアがインストールされたので、Web Consoleを再起動して新しくインストールされたImage Builder用のプラグインを有効にします。そして、Image Builderのビルドキューやその他の側面を管理するサービスを有効化します。

`systemctl restart cockpit; systemctl enable --now lorax-composer.service`{{execute}}

最後に、次のステップで管理者ではないユーザ __rhel__ を利用して、イメージのブループリントとマシンイメージのビルドを管理しますが、このユーザは __weldr__ グループに所属する必要があります。

`usermod -a -G weldr rhel`{{execute}}
