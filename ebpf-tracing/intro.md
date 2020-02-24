# Goal:

After completing this scenario, users will better understand the observability tools provided in RHEL with BPF.

# Concepts included in this scenario:
* Install bcc-tools
* Using bpftool to verify use of eBPF
* Run trivial eBPF tracing tools to get familiar with the concept

# Example Usecase:

In this example, we are going to use tools from the bcc-tools package to analyse what happens on a system during a yum update. We have picked yum update because it represents a non-trivial real world application. In a yum update, we have the following activity happening:

* TCP connections are established to configured repositories, which we will track with gethostlatency and tcplife.
* Many files will be opened on our XFS filesystem, which we will observe with filetop. We will also use xfsslower to determine which XFS operations take longer than 10ms to execute.
* Memory access. Linux uses a memory cache to ensure faster access to needed information than having to go to disk. Using cachestat, we will be able to see hits and misses on this cache in realtime. When everything Linux needs is cached, we should have zero misses and while the cache is being populated, we will see a number of misses. If the cache continues to be populated beyond the size of the cache, Linux will employ a LRU (Least Recently Used) algorithm with a lot of heuristics and some cached data will be removed and replaced with new data.
