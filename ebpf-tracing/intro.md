# Goal:

After completing this scenario, users will better understand the performance observability tools provided in Red Hat Enterprise Linux 8.

# Concepts included in this scenario:
* Install bcc-tools
* Using bpftool to verify use of eBPF
* Run trivial eBPF tracing tools to get familiar with the concept

# Example Usecase:

In this lab, you are going to use tools from the bcc-tools package to analyse what happens on a system during a `yum update`. We picked `yum update` because it represents a non-trivial, real world application. In a `yum update`, the following activity happens:

* TCP connections are established to configured repositories, which you will track with `gethostlatency` and `tcplife`.
* Many files will be opened on your XFS filesystem, which you will observe with `filetop`. You will also use `xfsslower` to determine which XFS operations take longer than 10ms to execute.
* Memory access. Linux uses a memory cache to ensure faster access to needed information than having to go to disk. Using `cachestat`, you will be able to see hits and misses on this cache in realtime. When everything Linux needs is cached, you should observe zero misses and while the cache is being populated, you will see a number of misses. If the cache continues to be populated beyond the size of the cache, Linux will employ a LRU (Least Recently Used) algorithm with a lot of heuristics and some cached data will be removed and replaced with new data.
