# Generate a CPU-intensive workload

**stress-ng** is designed to stress a system in different ways. It has a wide range of CPU specific stress tests that exercise floating point, integer, bit manipulation and control flow.

In this step of the lab, we will use the CPU-intensive matrix stressor in stress-ng to exercise the CPU floating point operations as well as memory and processor data cache. Of all the tests, this one generally heats x86 CPUs the best.

`stress-ng --matrix 0 -t 30s`{{execute T1}}

This test will run for a 1-minute duration and will exercise both the v-CPUs on the instance.

<pre class="file">
stress-ng: info:  [47161] dispatching hogs: 2 matrix
stress-ng: info:  [47161] successful run completed in 30.00s
</pre>
