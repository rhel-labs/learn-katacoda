# Validate Environment and Install Flame Graph Stack

In RHEL, there are two stacks for visualizing performance data - one based on PCP and Grafana, and the other based on perf and d3. For many performance troubleshooting use-cases, visualizing performance metrics is key and this lab will explain how to use the perf and d3 stack on RHEL.

In this lab, our setup consists of a single node system running MySQL. We have setup three terminal windows running on the local machine - The current terminal will be used for OS specific commands and to interact with MySQL. The Flame terminal will be used for running specific perf and d3 commands. The web terminal will be used to looking at the flame.

Let us use RHEL Application Streams to check if the MySQL module has been installed - 

`yum module list | grep 'MySQL Module'`{{execute T1}}

<pre class="file">
mysql                8.0 [d]      client, server [d]                       MySQL Module
</pre>

MySQL is not installed. Let us install MySQL using Application Streams

`yum module install -y mysql:8.0`{{execute T1}}

Let's verify that MySQL is installed 

`mysql -V`{{execute T1}}

Start the __MySQL Daemon (mysqld)__  

`systemctl start mysqld`{{execute T1}}

Check the status of the mysqld service 

`systemctl status mysqld --no-pager`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

   Loaded: loaded (/usr/lib/systemd/system/mysqld.service; disabled; vendor preset: disabled)
   Active: active (running) since Mon 2021-05-17 14:42:40 EDT; 6s ago
   
<< OUTPUT ABRIDGED >>
</pre>

Verify that the Active status is __active (running)__.

Load sample data into the MySQL database. This script creates a books database with two tables - authors and posts

`mysql < sample.sql`{{execute T1}}

Install the perf and d3 packages 

`sudo yum install -y perf js-d3-flame-graph`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Installed products updated.

Installed:
  js-d3-flame-graph-3.0.2-2.el8.noarch   libbabeltrace-1.5.4-3.el8.x86_64   libbpf-0.0.8-4.el8.x86_64   perf-4.18.0-240.22.1.el8_3.x86_64  

<< OUTPUT ABRIDGED >>
</pre>
