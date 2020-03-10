# Reviewing system Insights

After selecting your system from the Inventory page and reviewing some
overall data about it, click on the _Insights_ tab to view the Red Hat
Insights data that applies to this host.

![Host Insights](/rhel-labs/scenarios/insights-workshop/assets/host-homepage.png)

There are several Insights offered for this system.  Scroll down through the
list until you reach the one entitled _Decreased security in OpenSSH settings (ClientAlive)_

![Openssh Insight](/rhel-labs/scenarios/insights-workshop/assets/openssh-issue.png)

From the _Detected issues_ section of the rule, you can see that this Insight
is being triggered by the machine running OpenSSH and using some default
configuration settings.  

![Openssh Insight issue](/rhel-labs/scenarios/insights-workshop/assets/detected-issues.png)

In the _Steps to resolve_ section of the Insight, additional details, 
including your daemon settings as well as the suggested settings and an 
explaination of why this may cause an issue are described.

![Openssh Insight explaination](/rhel-labs/scenarios/insights-workshop/assets/issue-explaination.png)

The _Steps to resolve_ section continues with a description of how you
may want to configure the OpenSSH service as well as what would need to
be done after the service configuration is complete in order to resolve
the detected issue with the machine.

![Openssh Insight resolution](/rhel-labs/scenarios/insights-workshop/assets/issue-resolution.png)
