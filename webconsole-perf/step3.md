# Generate CPU-hot workload

**stress-ng** can stress various system resources such as CPU, cache, disk, memory, socket pipe I/O, scheduling and much more. 

Stress-ng has a wide range of CPU specific stress tests that exercise floating point, integer, bit manipulation and control flow. In this step of the lab, we will use the CPU-intensive matrix stressor, which is one of the many tests that heats CPUs the best.

Run the stress-ng matrix stressor -

`stress-ng --matrix 0 -t 45s`{{execute T1}}

The stressor should run for a 45-second duration and will drive up CPU utilization across both the v-CPUs on the instance.

<pre class="file">
stress-ng: info:  [47161] dispatching hogs: 2 matrix
stress-ng: info:  [47161] successful run completed in 45.00s
</pre>
