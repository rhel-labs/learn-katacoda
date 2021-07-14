# Using `df` to check disk usage

// move this before processes

// box is having problems? we know that full filesystems cause problems
// quick health checking

// larger filesystems can be closer to full and still be okay

// tmpfs is filesystems accessible by the machine that are stored in RAM and
ephemoral - don't have to care as much because they are in RAM. A reboot will
give you a fresh copy

// want to worry about logical partition for root the most


The `df` command, short for "disk free", shows a breakdown of disk usage.
The `-h` option will present the sizes in a human readable format:

`df -h`{{execute}}

<pre class=file>
Filesystem             Size  Used Avail Use% Mounted on
devtmpfs               890M     0  890M   0% /dev
tmpfs                  909M     0  909M   0% /dev/shm
tmpfs                  909M  8.5M  901M   1% /run
tmpfs                  909M     0  909M   0% /sys/fs/cgroup
/dev/mapper/rhel-root   35G  4.5G   30G  14% /
/dev/vda1             1014M  197M  818M  20% /boot
tmpfs                  182M     0  182M   0% /run/user/0
</pre>
