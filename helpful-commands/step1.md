# Manipulating file contents

`ls`{{execute}}

`cat`{{execute}}

`echo "text" >> file`{{execute}}

>_NOTE:_ You also may see the '>' redirection operator. This operator will
write the output to a file, overwriting the file if it already exists. By contrast,
the `>>` operator will append the output to the specified file.


`tail file`{{execute}}

Since this only displays the last ten lines of a file, it is particularly
useful for viewing recent entries in log files.
