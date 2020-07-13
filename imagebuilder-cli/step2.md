# Modifying a blueprint

In this step, you will be taking an existing blueprint used to build a machine
image and update it to include extra packages.

First, look at what blueprints are available on the system.

`composer-cli blueprints list`{{execute}}

<pre class='file'>
example-atlas
example-development
example-http-server
</pre>

This system has three example blueprints provided by Red Hat through the 
`lorax-composer` package installed in the previous step.  You will use the
__example-http-server__ blueprint for this lab.

In order to make changes to the blueprint, you will first save a copy of the
blueprint.  `composer-cli` will output a TOML (Tom's Obvious Minimal Language)
formatted file with the current description of the blueprint used to make
example-http-server machine images.

`composer-cli blueprints save example-http-server`{{execute}}

If you were interested, you can take a look at the __example-http-server.toml__
file now in your working directory using a tool like `cat` or `less`.

You will be adding `nodejs` to the list of software included in the
example-http-server blueprint.  `nodejs` is distributed as an application
stream for Red Hat Enterprise Linux, so you will need to add a __[[modules]]__
section to the example-http-server.toml file adding `nodejs` to the build.

`printf '\n[[modules]]\nname = "nodejs"\nversion = "*"' >> example-http-server.toml`{{execute}}

The `printf` command appends the following formatted stanza to the 
example-http-server.toml file:

<pre class='file'>

[[modules]]
name = "nodejs"
version = "*"
</pre>

Next, you will update the example-http-server blueprint definition to use
the version currently stored in your local example-http-server.toml file.
You will push this updated definition into the lorax-composer back-end.

`composer-cli blueprints push example-http-server.toml`{{execute}}

To verify that your update has been made, review the log of changes made
to the example-http-server blueprint.

`composer-cli blueprints changes example-http-server`{{execute}}

<pre class='file'>
example-http-server
    2020-07-13T23:07:57Z  e4284083bad43ded8a4a9ea2947a5f45be72f8c4
    Recipe example-http-server, version 0.0.2 saved.

<<< OUTPUT ABRIDGED >>>
</pre>

From the above output, you can see that just now a new version of the 
example-http-server blueprint was updated.

>**Note:** in the above command output, your date and time will be different
than the date and time that appears in the example output.

You can also review the contents of the example-http-server blueprint to verify
that the `nodejs` module entry is now reflected in the active version of the
blueprint instructions.

`composer-cli blueprints show example-http-server`{{execute}}

<pre class='file'>
name = "example-http-server"
description = "An example http server with PHP and MySQL support."
version = "0.0.2"
groups = []

[[modules]]
name = "httpd"
version = "2.4.*"

[[modules]]
name = "mod_ssl"
version = "2.4.*"

[[modules]]
name = "nodejs"
version = "*"

<<< OUTPUT ABRIDGED >>>
</pre>

In the above output, you can see that the `nodejs` module definition is now
included in the example-http-server blueprint definition.
