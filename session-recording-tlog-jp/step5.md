# セッションの記録

__rhel__ ユーザーとしてセッションを作成すると、セッションの記録を行えます。 ねんのため、 __rhel__ ユーザのパスワードは __redhat__ です。

`ssh rhel@localhost`{{execute}}

`ssh` セッションを開始するときに、 __rhel__ ユーザは __tlog__ 設定で指定された通知メッセージを受けとります。

<pre class=file>
rhel@localhost's password: <b>redhat</b>

ATTENTION! Your session is being recorded!

[rhel@somehost ~]$
</pre>

__rhel__ ユーザのセッションでいくつかコマンドを実行します。

`ls /tmp`{{execute}}   
   
`who`{{execute}}   
   
`df -hP`{{execute}}   
   
`yum list installed`{{execute}}

セッションにデータが記録されましたから、ユーザの`ssh`セッションからログアウトしましょう。

`exit`{{execute}}

