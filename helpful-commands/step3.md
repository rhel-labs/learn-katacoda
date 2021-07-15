# Locating files

Manipulating files is only useful if you can locate the file you need.

The `find` command is great for searching for files which
satisfy some specified criteria. This step will show an example using filename,
but you can also use it to look for files with ceratin permissions, empty files,
or much more.

`find / -name sudo.conf`{{execute T1}}

<pre class=file>
/etc/dnf/protected.d/sudo.conf
/etc/sudo.conf
/usr/lib/tmpfiles.d/sudo.conf
/usr/share/doc/sudo/examples/sudo.conf
</pre>

Instead of having to search through countless directories, you can quickly
decide which of these _sudo.conf_

>_Note:_ An in-depth explanation of using `find` to sort by file permissions
is included in the [File Permissions Basics lab](https://lab.redhat.com/file-permissions).  

`find` is great if you are looking for criteria about a file, but if you instead
want to locate specific file contents, the `grep` command is what you need.


// find can be i/o intensive, which can sap system resources and have unintended
effects

// take a look at locate, run updatedb command in background

// queries database, comes back super fast and is not I/O instensive
// if you dl'd file you will not locate
