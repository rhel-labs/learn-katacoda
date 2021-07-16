# Searching for text within files and outputs

`find` is great if you are looking for criteria about a file, but if you instead
want to locate specific file contents, the `grep` command is what you need.
To illustrate this, search for the words you added to the _messages_ log file:

`grep -r "Hello World" /var/log`{{execute T1}}

<pre class=file>
/var/log/messages:Jul 16 21:38:22 be3f7e9f7264 root[24468]: Hello World
</pre>

Later on in this lab you will see another example of how to combine `grep` with the
pipe operator (`|`) to search within the output of another command.  
