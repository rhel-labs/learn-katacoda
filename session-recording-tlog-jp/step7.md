# 記録されたセッションをコマンドラインでレビューする

記録されたセッションをコマンドラインでレビューするためには `tlog-play` コマンドを使います。どのセッションをリプレイするか指定するためセッションのIDを引数にとります。

デフォルトの設定では、記録されたセッションデータは __journald__に送られます。そのため利用可能なセッションデータを見つけるには `journalctl` を利用します。以下のコマンドでjournalログを探して <pre>"rec"</pre> という文字列とIDを含むメッセージを表示します。

`journalctl -o verbose | grep -P "\"rec\".*?\,"`{{execute}}

以下は該当するメッセージの例です。通常は1つではなく複数のメッセージがそれぞれのセッションに存在します。

![Journal Log Message](/smcbrien/scenarios/session-recording-tlog/assets/log-message.png)

セッションをリプレイするには `tlog-play` にセッションのIDをつけて実行します。上で表示されたメッセージから、コマンドは以下のようになります。

`tlog-play -r journal -M TLOG_REC=de1645090e34a4220b8f2d237614c9731-518b-70b124`

あなたのセッションIDは異なるでしょうから、以下のコマンド例ではシェルを使ってjournalに記録された最初の記録を表示します。
セッションをリプレイすると、現在の端末セッションはリプレイのために占有されます。一端リプレイが完了すると、セッションに制御が戻ります。 <CTRL>-C で再生を止めることもできます。

`tlog-play -r journal -M TLOG_REC=$(journalctl -o verbose | grep -P "\"rec\".*?\." | cut -d, -f3 | cut -d: -f2 | head -n 1 | sed -e s/\"//g)`{{execute}}

上記のコマンドはセッション完了までリアルタイムで再生を行います。


