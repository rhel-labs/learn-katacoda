# Creating an application image from scratch

Starting from an existing base container isn't the only option available to `buildah`.  `Buildah` can create a minimal container image that contains metadata and a filesystem stub.   

To create this style of image use the `scratch` special target for `buildah from`.

`buildah from scratch`{{execute T1}}

```
working-container
```

Since there's no starting image, the working container will be called `working-container`.

We can start working with the scratch container using tools on the host by mounting the container filesystem on the host using `buildah mount`.

> _NOTE:_ We capture the output of the `buildah` command in the variable *scratchmnt* to make it easier to work with the filesystem path in these exercises.

`scratchmnt=$(buildah mount working-container)`{{execute T1}}

`echo ${scratchmnt}`{{execute T1}}

```
/var/lib/containers/storage/overlay/5199b9cbf441fe93e3629f9d6336fd7008858b9b6e23629a724ccc2f567f3feb/merged
```

Right now, that directory is empty.

`ls -l ${scratchmnt}`{{execute T1}}

```
total 0
```
