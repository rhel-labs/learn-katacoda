# Manipulating file contents

The first step towards modifying files is knowing what files exist. Use `ls`
to take a look at the contents of the current directory:

`ls`{{execute T1}}

<pre class=file>
anaconda-ks.cfg  example.txt  openscap_data  original-ks.cfg
</pre>

There are a few configs and a subdirectory, but you will use _quote.txt_
for this exercise. Use the `cat` command to quickly check what is in this file.
The `cat` command is short for "concatenate", but it is much more versatile
than that name suggests.

`cat quote.txt`{{execute T1}}

<pre class=file>
Just thinking about everything I have been through, and how huge it all feels.
The fact that it is just a small part of something larger
</pre>

Now you can complete the quote by redirecting the output of the `echo` command.
The command below uses the append redirection operator (`>>`) to cause the
output of the `echo` command to be written to the end of the file _quote.txt_.

`echo "makes it seem more manageable." >> quote.txt`{{execute T1}}

There is no output, so view the file contents once again to see this change reflected:

`cat example.txt`{{execute T1}}

<pre class=file>
Just thinking about everything I have been through, and how huge it all feels.
The fact that it is just a small part of something larger
makes it seem more manageable.
</pre>

The `>>` operator allows you to add to files from the command line and is particularly
useful in shell scripting. You can also use it when a command has a lengthy output
and you want to view that output in a text editor.  

>_NOTE:_ You may also encounter the `>` redirection operator. This operator will
write the output to a file, overwriting the file if it already exists. By contrast,
the `>>` operator will append the output to the specified file.

//Talk about input and pipe
