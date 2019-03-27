Determine the available versions of nodejs.

`yum module list nodejs`{{execute}}

<pre class=file>
Red Hat Enterprise Linux 8 for x86_64 - AppStream Beta (RPMs)
Name                 Stream              Profiles                                            Summary
nodejs               10 [d]              development, minimal, s2i, default [d]              Javascript runtime
nodejs               8                   development, minimal, s2i, default [d]              Javascript runtime

Hint: [d]efault, [e]nabled, [x]disabled, [i]installed
</pre>

There are two versions of nodejs available in the Application Stream, version 8 and version 10.   

nodejs version 10 is set as the default, meaning if someone installed nodejs with no specific options or arguments, version 10 would be the one installed.

