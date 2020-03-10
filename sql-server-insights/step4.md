# Reviewing system Insights

After selecting your system from the Inventory page and reviewing some
overall data about it, click on the _Insights_ tab to view the Red Hat
Insights data that applies to this host.

![Host Insights](/rhel-labs/scenarios/insights-workshop/assets/host-homepage.png)

There are several Insights offered for this system.  Scroll down through the
list until you reach the one entitled _The mssql-server service will fail to start when the ownership or group of Microsoft SQL Server directory /var/opt/mssql is not correct_

From the _Detected issues_ section of the rule, you can see that this Insight
is being triggered by the machine running Microsoft SQL Server with incorrect ownership or group of /var/opt/mssql.  

In the _Steps to resolve_ section of the Insight, there is a command to run to change ownership of the /var/opt/mssql folder
to the correct user and group which is mssql. 
