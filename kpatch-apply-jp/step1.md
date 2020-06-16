# Kernel Live Patchをはじめる

クリティカルな重大度のCommon Vulnerability and Exposure (CVE) がアナウンスされると、Red HatはそのCVEむけの修正を含む更新されたソフトウェアパッケージを作成します。 しかし従来は、更新された kernel パッケージを適用するには、システムメンテナンスのスケジュールを組む必要がありました。新しいカーネルの適用にはシステムの再起動が含まれるためです。

Kernel Live Patching は、Red Hat Enterprise Linux の Extended Update Support (EUS)とともに利用されることを想定したサービスです。Red Hat は一部のCVE用に Kernel Live Patch(kpatches) をパッケージ化します。組織はシステムのダウンタイムを計画せずに、そのCVEへの対策を含む更新を実行中の Red Hat Enterprise Linux システムへ適用することができます。


まずはじめに、`kpatch` パッケージをインストールします:

`yum -y install kpatch`{{execute}}

これで、 `kpatch` アプリケーションがインストールされました。
以下のコマンドでシステムには現在カーネルにロードされたkpatchがないことを確認できます。

`kpatch list`{{execute}}

<pre class=file>
Loaded patch modules:

Installed patch modules:

</pre>

予想通り、パッチモジュールはロードされていませんし、マシンにも まだ インストールされていません。
