# Reviewing a recorded session from the command-line

The command to use to review recorded sessions from the command-line is
`tlog-play`, which takes a session identifier to determine which session data
to replay.  

In the default configuration, recorded session data is sent to the 
**journald** managed log.  As a result, to determine the available session
data, you will use the `journalctl`.  The following command will search
through the journal log and locate strings that contain the <pre>"rec"</pre>
string, plus the identifier included in that message.

`journalctl -o verbose | grep -P "\"rec\".*?\,"`{{execute}}

![Web Console Navigation](/smcbrien/scenarios/session-recording-tlog/assets/log-message.png)

Above, is an example of one of those messages, but there will likely be more 
than one message associated with each session.

To replay the session, you run `tlog-play` with the session identifier, using
the log message displayed above, the command would look like:  
`tlog-play -r journal -M TLOG_REC=de1645090e34a4220b8f2d237614c9731-518b-70b124`

Your session identifier is going to be different, the following command will
use some shell tools to isolate the first recording from your journal.

`tlog-play -r journal -M TLOG_REC=\`journalctl -o verbose | grep -P "\"rec\".*?\." | cut -d, -f3 | cut -d: -f2\``{{execute}}

The above command will replay the session to completion, in real-time.

