# 設定のレビュー

ラボ環境の端末タブに戻ります。

前のステップで触れたように、Web Consoleはsssd用に小さな設定ファイル __/etc/sssd/conf.d/sssd-session-recording.conf__  を出力しています。対象が __all__ となっていて全ユーザとグループの全セッションが記録されることを確認しましょう。


`cat /etc/sssd/conf.d/sssd-session-recording.conf`{{execute}}

<pre class=file>
[session_recording]
scope=all
users=
groups=
</pre>

他に表示されていた設定オプションは __/etc/tlog/tlog-rec-session.conf__ に記録されています。たとえば、セッションが記録されるユーザに対して __notice__ で指定したメッセージが出力されます。必要ならこのファイルも確認することができます。

`cat /etc/tlog/tlog-rec-session.conf`{{execute}}

<pre class=file>
<<OUTPUT ABRIDGED>>

// "notice" : "\nATTENTION! Your session is being recorded!\n\n",

</pre>
