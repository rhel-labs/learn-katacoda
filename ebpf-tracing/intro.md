# Goal:

After completing this scenario, users will be able to trace disk latency and IO
utilization with eBPF.

# Concepts included in this scenario:
* Install bcc-tools
* Run trivial eBPF tracing tools to get familiar with the concept
* Using bpftool to verify use of eBPF
* Tracing disk latency with eBPF
* Tracing disk IO utilization with eBPF

# Example Usecase:

To increase reliability of datacenter operations we want to monitor disk latency on the systems. Sudden spikes in disk latencies might indicate possible issues with the disks or storage systems. We also want to monitor what applications are utilizing most of the IO on these disks.
