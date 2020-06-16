# Goal:
このラボを行うことで、ユーザはKernel Live Patchをシステムに適用し、更新されたカーネルで再起動せずにセキュリティの脆弱性を解決することができるようになります。

# このラボに含まれるコンセプト:

* Kernel Live Patching ソフトウェアとサービスのインストール
* Kernel Live Patch を実行中のシステムに適用
* Kernel Live Patch の状態を確認
* Red Hatが公開したCommon Vulnerabilities and Exposures (CVEs) 情報の詳細を探す

# 利用例:

クリティカルなカーネル CVE に対する緩和策のための緊急カーネルメンテナンスイベントの代替手段を提供します。実行中のカーネルにlive patchを当てた後、ある時点で、更新されたkernelパッケージをシステムに適用してシステムを再起動するためのメンテナンスウィンドウをスケジュールすることが前提となります。Kernel Live Patchを利用することで、組織は Critical CVE に対する修正プログラムがリリースされたタイミングではなく、このウィンドウがいつ発生するかを調整することができます。  

