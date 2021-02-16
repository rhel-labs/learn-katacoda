# Modifying a blueprint

In this step, you will be creating a new blueprint used to build a machine image and update it to include extra packages.

First, look at what blueprints are available on the system.

`composer-cli blueprints list`{{execute}}

This system has no existing blueprints. So, let us go ahead and create a blueprint.

The `composer-cli` will take as input a TOML formatted file (Tom's Obvious Minimal Language)
that describes the blueprint used to define our machine image.

To save  some time look at the __node-app-server.toml__ file that has already been pre-created using a tool 
like `cat` or `less`.

`cat node-app-server.toml`{{execute}}

<pre class='file'>
name = "node-app-server"
description = "Sample image for the node.js application server"
version = "0.0.1"
</pre>

The name of the blueprint is called __Node App Server__. It is recommended that you also include a description so that 
others using this blueprint know what system image they are building. At this point, the blueprint file does not have 
any packages but we will add the `nodejs` and `nginx` packages to it. 

In order to create the blueprint from the file, we will use the `blueprints push` cli option.

`composer-cli blueprints push node-app-server.toml`{{execute}}

Now that the blueprint is saved, you can add additional components.  

`nodejs` is distributed as an application stream for Red Hat Enterprise Linux, so you will need to add a __[[packages]]__
section to the node-app-server.toml file adding `nodejs` to the build.

`printf '\n[[packages]]\nname = "nodejs"\nversion = "*"' >> node-app-server.toml`{{execute}}

The `printf` command appends the following formatted stanza to the node-app-server.toml file.

<pre class='file'>
[[modules]]
name = "nodejs"
version = "*"
</pre>

Similarly, add the `nginx` package to the blueprint 

`printf '\n[[packages]]\nname = "nginx"\nversion = "*"' >> node-app-server.toml`{{execute}}

Next, you will update the node-app-server blueprint definition to use the version currently stored in your local node-app-server.toml file.
You will push this updated definition into the osbuild-composer back-end.

`composer-cli blueprints push node-app-server.toml`{{execute}}

To verify that your update has been made, review the log of changes made
to the node-app-server blueprint.

`composer-cli blueprints changes node-app-server`{{execute}}

<pre class='file'>
node-app-server
    2020-07-13T23:07:57Z  e4284083bad43ded8a4a9ea2947a5f45be72f8c4
    Recipe node-app-server, version 0.0.2 saved.

<<< OUTPUT ABRIDGED >>>
</pre>

From the above output, you can see that just now a new version of the
example-http-server blueprint was updated.

>**Note:** in the above command output, your date and time will be different
than the date and time that appears in the example output.

You can also review the contents of the example-http-server blueprint to verify
that the `nodejs` module entry is now reflected in the active version of the
blueprint instructions.

`composer-cli blueprints show node-app-server`{{execute}}

<pre class='file'>
name = "node-app-server"
description = "Sample image for the node.js application server"
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
