# Troubleshooting a compose

Sometimes machine image builds are not successful.  Looking at the logs
of the build may be useful when troubleshooting.

`composer-cli compose log $(composer-cli compose status | head -n1 | cut -f1 -d" ")`{{execute}}

Throughout the lab, you have seen the UUID of the compose transaction used in
command output and as an argument for working with individual machine image
operations.  The lorax-composer back-end also uses this UUID to store data about
this, specific, machine image build.  The results of all the machine image
builds are stored in `/var/lib/lorax/composer/results`.

To look at the data associated with the machine image build you completed in
the lab:

`ls /var/lib/lorax/composer/results/$(composer-cli compose status | head -n1 | cut -f1 -d" ")`{{execute}}

<pre class="file">
blueprint.toml  config.toml  ext4-filesystem.ks  final-kickstart.ks  logs    times.toml
COMMIT          deps.toml    filesystem.img      frozen.toml         STATUS
</pre>

The directory includes the kickstart instructions, logs, status, and resulting
image.  You interacted with many of these files using the `composer-cli`
commands in previous steps.
