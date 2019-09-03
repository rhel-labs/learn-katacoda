# セッション記録の設定と有効化

*Session Recording* アプリケーションは最初空白で、 __No recorded sessions__ と表示されています。右上の角にある *ギアのアイコン* をクリックし、セッション記録の設定をおこないます。

![Session Recording Homepage](/smcbrien/scenarios/session-recording-tlog/assets/session-recording-initial.png)

そうすると、セッション記録についての設定情報のページへアクセスできます。このシナリオでは、ほとんどをデフォルトのままにして、下部にある __SSSD Configuration__ セクションで *Scope* を *All* にします。この設定で、このシステムで端末を開いた全てのユーザとグループに対してセッション記録を実施します。

![Session Recording Configuration](/smcbrien/scenarios/session-recording-tlog/assets/all-scope-selected.png)

*Save* ボタンをクリックすると、Web Consoleはsssdデーモン用に対象を定義する小さな設定ファイルを出力します。

設定を保存したら、Web Consoleの *Session Recording* ページに戻ります。

![Return to Session Recording Homepage](/smcbrien/scenarios/session-recording-tlog/assets/return-main-session-page.png)

