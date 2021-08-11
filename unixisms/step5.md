# What is epoch time?

Time is a fundamental part of productivity, but frameworks must be established
to ensure that humans and computers can be on the same page about time.
On Linux, one of these frameworks is the __unix epoch__. This is a standardized
date and time that is defined as the beginning of time for unix systems.
From this, an _epoch time_ (or _unix time_) is defined as the number of seconds
that have elapsed since the __unix epoch__.

The __unix epoch__ is defined as

Unix time is exceptionally well-documented online, and if you wish to learn more
the [Wikipedia page](https://en.wikipedia.org/wiki/Unix_time) on the subject is a great place to start.

Now, let's try a few examples of converting between time formats.
The `date` command is useful for displaying the current date and time of
your system. The value output depends on the timezone you have configured,
and the format of the output can be controlled using format strings.

If you run `date` without any arguments, it will print the date and time
in the following format:

`date`{{execute T1}}

<pre class=file>
Mon Aug  9 20:46:56 EDT 2021
</pre>

>_NOTE:_ The output should match the current date and time when you are
running this lab, but it will be formatted using the Eastern Timezone since
that is the default for the lab systems.

Converting a date and time to epoch time is as simple as a single argument (`+%s`)
with `date`. You can also specify the `-d` option to input a datetime instead of
using the current one.

`date -d "Dec 12 2014 20:00:00" +%s`{{execute T1}}

This will show you the epoch time corresponding to the string you input:

<pre class=file>
1418432400
</pre>

You can convert in the reverse direction with `date` as well by using the `--date`
option, then prepending a `@` symbol to the epoch time you would like to convert.
This syntax specifies that you would like to know the date at the given epoch time.
Try this using the epoch time you just received from the previous command:

`date --date @1418432400`{{execute T1}}

<pre class=file>
Fri Dec 12 20:00:00 EST 2014
</pre>

This results in the original date that you input a few commands ago.
Notice that this specifies the date in the timezone for this lab system,
Eastern Time.

For more information on using `date`, check out the [date man page](https://man7.org/linux/man-pages/man1/date.1.html).
