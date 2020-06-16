# kpatchのCVEを識別する

それぞれの kpatch-patch パッケージには、パッチセットに何が追加されたのか、どの CVE へ適用されたのかの変更履歴があります。 変更履歴は kpatch-patch パッケージに対して `rpm` コマンドを使うことで見ることができます。 以下では、変更ログで参照されるパッケージが前のステップでインストールしたものであることを確実にするため、コマンドラインに少しスクリプトを埋め込んでいます。

`rpm -q --changelog $(rpm -qa | grep kpatch-patch)`{{execute}}

<pre class="file">
* Mon May 11 2020 Joe Lawrence <joe.lawrence@redhat.com> [1-2.el8]
- Workaround kpatch ppc64le leaf functions in previous patch [1827332] {CVE-2020-10711}

* Fri May 08 2020 Joe Lawrence <joe.lawrence@redhat.com> [1-1.el8]
- netlabel: cope with NULL catmap [1827332] {CVE-2020-10711}

* Fri Apr 10 2020 Joe Lawrence <joe.lawrence@redhat.com> [0-0.el8]
- An empty patch to subscribe to kpatch stream for kernel-4.18.0-193.el8 [1822309]
</pre>

上記のサンプル出力では、最初に表示される最新のエントリは、 CVE-2020-10711 を解決するためのパッチセットでした。

# Kernel Live Patch のサポート

Red Hat は、Extended Update Support (EUS) リリースのパッチセットを最大 1 年間維持します (詳細は [Red Hat Enterprise Linux 8 ライフサイクル](https://access.redhat.com/support/policy/updates/errata#RHEL8_Life_Cycle) を参照してください)。 Kernel Live Patch は、選択されたImportant および Critical 深刻度の CVE に対して適用されます。


システムはいつまでもカーネルライブパッチが適用されたカーネルで動くことは意図されていません。 組織が実行中のカーネルにライブパッチを当てた後、ある時点で、システムに更新されたカーネルパッケージを適用してシステムを再起動し、システムを正常化するためのメンテナンスウィンドウを設定することが想定されています。Kernel Live Patchを適用することで、組織は Critical CVE の修正プログラムがリリースされたタイミングではなく、このウィンドウをいつにするかを調整することができます。

Red Hat がサポートしている内容についての最も正確なガイダンスは、ナレッジベースの記事 [Is live kernel patch (kpatch) supported in Red Hat Enterprise Linux?] (https://access.redhat.com/solutions/2206511) をチェックしてください。

# Red Hatの追加情報


このラボでは、リスト、適用、システムにKernel Live Patchが適用されたことの確認を行いました。管理者はどのようにして、システムでこの作業が必要であること・可能であることを知るのでしょうか?

Red Hat 製品セキュリティチームは、Red Hat 製品に影響を与える CVE のリストを管理しています。[Vulnerability Responses](https://access.redhat.com/security/vulnerabilities), [Red Hat CVE Database](https://access.redhat.com/security/security-updates/#/cve)

各CVEには、追加情報やリソースのためのページがあります。
[Page for CVE-2020-10711](https://access.redhat.com/security/cve/cve-2020-10711)

上でリンクされたページには、CVEとシステムやサービスへの影響のほかに、システム構成がCVEの影響をうけるかの検出スクリプトのような追加のリソースを提供することがあります。
