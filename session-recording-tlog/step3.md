# Configuring and enabling session recording

The *Session Recording* application is initially blank, reporting **No recorded sessions**.  Click the gear icon in the upper right-hand corner to be taken to the configuration settings for session recording.

![Web Console Navigation](/smcbrien/scenarios/terminal-session-recording/assets/session-recording-initial.png)

On the resulting page, you will be offered access to configuration information
for session recording.  For the purpose of this scenario, you will accept most
of the defaults and under the **SSSD Configuration** section at the bottom of
the page, select the **Scope** of **All**, which will apply session recording
to all users and groups that open sessions on the system.

![Web Console Navigation](/smcbrien/scenarios/terminal-session-recording/assets/all-scope-selected.png)

Once you click the **Save** button, Web Console will write out a small
configuration file detailing the scope for the sssd daemon.

After saving the configuration, return the Web Console to the main *Session
Recording* page.

![Web Console Navigation](/smcbrien/scenarios/terminal-session-recording/assets/return-main-session-page.png)

