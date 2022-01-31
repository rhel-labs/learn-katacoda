---
slug: step3
id: g118xniycfjo
type: challenge
title: Step 3
tabs:
- title: Terminal
  type: terminal
  hostname: rhel
- title: RHEL Web Console
  type: service
  hostname: rhel
  path: /
  port: 9090
difficulty: basic
timelimit: 500
---
# Navigate to Image Builder application
After logging into the Web Console, you are probably already looking at the
Image Builder tab.  If, instead, you are looking at the *Host* tab, navigate
to the Image Builder tab, as shown below:

![Navigate to Image Builder](../assets/Nav-ImageBuilder.png)

Because you have not used Image Builder before, you will need to start the
back-end service by clicking the *Start* button.  Notice that the
*Automatically start osbuild-composer on boot* is selected, which means the
service will automatically start after this whenever the system is booted.

![Start Image Builder Service](../assets/ImageBuilder-start-service.png)

Now that the back-end service has been started, you will notice that the
application screen updates and you can now *Create Blueprint*, which is
what you will do on the next step.

