---
slug: step4
type: challenge
title: Step 4
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
timelimit: 50
---
# Reviewing system Insights

After selecting your system from the Inventory page and reviewing some
overall data about it, click on the _Advisor_ tab to view the Red Hat
Insights data that applies to this host.

![Host Insights](./assets/host-homepage-v2.png)

There may be several recommendations listed for this system.  Scroll down through the
list until you reach the one entitled _Network connection loss occurs when the NetworkManager uses an internal DHCP client_

![NetworkManager Insight](./assets/NetworkManager-issue.png)

From the _Detected issues_ section of the recommendation, you can see that this recommendation
is being triggered by the machine running an older version of NetworkManager.

![NetworkManager Insight issue](./assets/NetworkManager-detected-issue.png)

In the _Steps to resolve_ section of the recommendation, step-by-step
guidance on how to resolve the issue is provided.  In this case, to
update the system and restart the service.

![NetworkManager Issue Resolution](./assets/NetworkManager-resolution.png)

The _Steps to resolve_ section continues with an additional option for
remediating the recommendation if you are unable to update the NetworkManager
RPM.  Specifically, the recommendation includes some additional file
configuration settings followed by a service restart.
