# Udica を使った SELinux コンテナポリシーの生成

カスタム SELinux セキュリティポリシーを作成するために、Udica はコンテナの JSON ファイルをスキャンして、コンテナが必要とする Linux のcapabilityを検出します。ネットワークポートも同様で、UdicaがSELinuxユーザ空間ライブラリを使用して、コンテナが使用するポートに対応する正しいSELinuxラベルを取得します。

ラボインターフェイスの「Terminal」タブで、podman を使用して実行中のコンテナを検査し、コンテナを検証した結果をJSON 形式のファイルに書き出します。

`podman inspect $CONTAINERID > container.json`{{execute T1}}

コンテナJSONファイルを使用してカスタムSELinuxセキュリティポリシーを生成するようUdicaに指示します。この例では、カスタム SELinux セキュリティポリシーの名前は 'my_container' となります。

`udica -j container.json my_container`{{execute T1}}

<pre class="file">

Policy my_container created!

Please load these modules using:
\# semodule -i my_container.cil /usr/share/udica/templates/{base_container.cil,net_container.cil,home_container.cil}

Restart the container with: "--security-opt label=type:my_container.process" parameter
</pre>

コンテナ用のカスタム SELinux セキュリティポリシーを作成しました。これで、このポリシーをカーネルにロードして有効にすることができます。

`semodule -i my_container.cil /usr/share/udica/templates/{base_container.cil,net_container.cil,home_container.cil}`{{execute T1}}

ポリシーを有効にするには、コンテナを停止して再起動します。

`podman stop $CONTAINERID`{{execute T1}}

イメージから、新しいカスタムコンテナポリシーを使用する、新しいコンテナランタイムを作成します。

`CONTAINER=$(podman run --security-opt label=type:my_container.process -v /home:/home:ro -v/var/spool:/var/spool:rw -d -p 80:80 -it registry.access.redhat.com/ubi8/ubi)`{{execute T2}}
