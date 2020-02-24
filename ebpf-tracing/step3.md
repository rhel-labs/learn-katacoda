In just a moment, we will start the yum update in Terminal 1, but first let's note what we want to observe:

In terminal 2, we are running gethostlatency, and this is going to give us latency statistics on the getaddrinfo() and gethostbyname() system calls. Effectively, we'll get to see how long these take and which hostnames our applications need IP addresses for. This can be useful for discovering interesting connections that you may not be aware your applications are making.

In terminal 3, we are running tcplife and this will tell us a lot of data about established tcp connections, and the total time that the connection was alive. When yum is finished downloading packages, we should get entries in tcplife for the exact amount of time that yum spent downloading packages over the tcp connections that it established for this activity.

In terminal 4, we are going to see applications accessing files in realtime, so this will get pretty busy.

In terminal 5, we probably won't see much until yum update starts installing the packages. Once it starts to install the packages, it's going to push the boundaries of what our virtual machine's storage can keep up with while delivering <10ms latency on XFS operations. You will see operations taking longer than 10ms and the files these operations were operating on.

In terminal 6, we will get to see in real time our hits and misses on the Linux memory cache. The second column is misses and the third column is hits. We should have mostly 0 misses for the first part of the yum update. Once we get to the installation of packages, we should see our misses start to increase.

Now that we have established what we want to observe, let's run:
`yum update -y`{{execute T1}}

Time to begin observing what happens on the system during the different states of the yum update:

* Updating repository metadata
* Determining what packages on the system need to be updated.
* Downloading the appropriate packages for updates.
* Installing the updates and removing old packages.
* Verifying the updates have been successful.

