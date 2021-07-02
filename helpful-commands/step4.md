# Using `free` to view information about the system memory usage

Processes require memory to run, so when the system is running low on free
memory it can slow down significantly. The `free` command is useful for quickly
getting a summary of memory usage.

`free -h`{{execute}}

The `-h` option outputs the information in a human-readable format.

If the available memory is very low, the fourth column of `ps aux` can be
used for finding which processes are the culprits.

// put something here where i actually run a process that will tank memory,
then kill it?
