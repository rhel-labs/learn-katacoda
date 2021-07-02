# Viewing processes

`ps`{{execute}}

The output of this command is often very lengthy, so this is a great chance
to apply what you just learned in the previous step. Using the pipe operator (`|`),
pipe the output of `ps aux` into the `grep` command to search for a specific
process:

`ps aux | grep `{{execute}}

>_NOTE:_ For more info on using `ps` (including how to end processes), check
out the [Service Administration Basics lab](https://lab.redhat.com/service-admin)


`top`{{execute}}
