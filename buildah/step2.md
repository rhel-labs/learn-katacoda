# KATACODA Markdown additions
More examples available on [Katacoda GitHub] (https://github.com/katacoda/scenario-examples)

EXECUTING MARKDOWN CODE BLOCKS ADDS COMMAND AND TARGET *Terminal 1*.

`podman run -it rhel8-httpd /bin/bash`{{execute T1}}

ALLOWING MARKDOWN CODE BLOCKS TO BE COPIED ADDS COMMAND

`podman run -it rhel8-httpd /bin/bash`{{copy}}

PASSING TO EDITOR INTERFACE REQUIRES HTML TAG:

<pre class="file">
bash-4.4#
</pre>

# Creating an application image from scratch

Starting from an existing base container isn't the only option available to buildah.  Buildah can create a minimal container image that only contains metadata and a filesystem stub.  Since there's no starting image, the working container will be called `working-container`.

`buildah from scratch`{{execute T1}}

```
working-container
```

We can start working with the scratch container using tools on the host by mounting the overlay filesystem.  We capture the output of the `buildah` command in a variable to make it easier to work with in these exercises.

`scratchmnt=$(buildah mount working-container)`{{execute T1}}

```
/var/lib/containers/storage/overlay/b469dd468110ed394288e140a359eb1b96d7429de99fe104720be6d379f706cb/merged
```

Right now, that directory is empty.

`ls -l ${scratchmnt}`{{execute T1}}

```
total 0
```

In order to install `httpd` in the scratch container, use `yum` with the `installroot` option targeting the mount point of the container's filesystem.

`yum install --installroot ${scratchmnt} httpd --releasever 8 --setopt=module_platform_id="platform:el8" -y`{{execute T1}}

```
Installed:
  httpd-2.4.37-11.module+el8.0.0+2969+90015743.x86_64                               
  libxkbcommon-0.8.2-1.el8.x86_64                                                   
  apr-util-openssl-1.6.1-6.el8.x86_64                                               
  apr-util-bdb-1.6.1-6.el8.x86_64                                                   
  openssl-pkcs11-0.4.8-2.el8.x86_64                                                 
  hardlink-1:1.3-6.el8.x86_64                                                       
  shared-mime-info-1.9-3.el8.x86_64                                                 
  kpartx-0.7.8-7.el8.x86_64                                                         
  grubby-8.40-34.el8.x86_64                                                         
  cracklib-dicts-2.9.6-15.el8.x86_64                                                
  redhat-release-eula-8.0-0.44.el8.x86_64                                           
  kbd-2.0.4-8.el8.x86_64                                                            
  diffutils-3.6-5.el8.x86_64                                                        
  pigz-2.4-2.el8.x86_64                                                             
  trousers-0.3.14-2.el8.x86_64                                                      
  xkeyboard-config-2.24-3.el8.noarch                                                
  apr-1.6.3-9.el8.x86_64                                                            
  apr-util-1.6.1-6.el8.x86_64                                                       
  httpd-tools-2.4.37-11.module+el8.0.0+2969+90015743.x86_64                         
  httpd-filesystem-2.4.37-11.module+el8.0.0+2969+90015743.noarch                    
  mod_http2-1.11.3-2.module+el8.0.0+2969+90015743.x86_64                            
  libcurl-7.61.1-8.el8.x86_64                                                       
  openssl-libs-1:1.1.1-8.el8.x86_64                                                 
  dbus-tools-1:1.12.8-7.el8.x86_64                                                  
  libffi-3.1-18.el8.x86_64                                                          
  json-c-0.13.1-0.2.el8.x86_64                                                      
  dracut-049-10.git20190115.el8.x86_64                                              
  openldap-2.4.46-9.el8.x86_64                                                      
  libxml2-2.9.7-5.el8.x86_64                                                        
  info-6.5-4.el8.x86_64                                                             
  which-2.21-10.el8.x86_64                                                          
  cracklib-2.9.6-15.el8.x86_64                                                      
  libutempter-1.1.6-14.el8.x86_64                                                   
  gmp-1:6.1.2-8.el8.x86_64                                                          
  gawk-4.2.1-1.el8.x86_64                                                           
  curl-7.61.1-8.el8.x86_64                                                          
  coreutils-8.30-6.el8.x86_64                                                       
  popt-1.16-14.el8.x86_64                                                           
  libselinux-2.8-6.el8.x86_64                                                       
  libstdc++-8.2.1-3.5.el8.x86_64                                                    
  libssh-0.8.5-2.el8.x86_64                                                         
  dbus-1:1.12.8-7.el8.x86_64                                                        
  grep-3.1-6.el8.x86_64                                                             
  glib2-2.56.4-1.el8.x86_64                                                         
  readline-7.0-10.el8.x86_64                                                        
  filesystem-3.8-2.el8.x86_64                                                       
  libseccomp-2.3.3-3.el8.x86_64                                                     
  libblkid-2.32.1-8.el8.x86_64                                                      
  chkconfig-1.11-1.el8.x86_64                                                       
  grub2-tools-1:2.02-66.el8.x86_64                                                  
  libcom_err-1.44.3-2.el8.x86_64                                                    
  redhat-release-8.0-0.44.el8.x86_64                                                
  gzip-1.9-4.el8.x86_64                                                             
  libidn2-2.0.5-1.el8.x86_64                                                        
  libpsl-0.20.2-5.el8.x86_64                                                        
  procps-ng-3.3.15-1.el8.x86_64                                                     
  keyutils-libs-1.5.10-6.el8.x86_64                                                 
  gettext-0.19.8.1-14.el8.x86_64                                                    
  rpm-libs-4.14.2-9.el8.x86_64                                                      
  krb5-libs-1.16.1-22.el8.x86_64                                                    
  coreutils-common-8.30-6.el8.x86_64                                                
  libpwquality-1.4.0-9.el8.x86_64                                                   
  lua-libs-5.3.4-10.el8.x86_64                                                      
  pkgconf-1.4.2-1.el8.x86_64                                                        
  zlib-1.2.11-10.el8.x86_64                                                         
  libsigsegv-2.11-5.el8.x86_64                                                      
  libcap-ng-0.7.9-4.el8.x86_64                                                      
  dbus-daemon-1:1.12.8-7.el8.x86_64                                                 
  libdb-5.3.28-36.el8.x86_64                                                        
  brotli-1.0.6-1.el8.x86_64                                                         
  cryptsetup-libs-2.0.6-1.el8.x86_64                                                
  libxcrypt-4.1.1-4.el8.x86_64                                                      
  libkcapi-hmaccalc-1.1.1-16_1.el8.x86_64                                           
  grub2-common-1:2.02-66.el8.noarch                                                 
  shadow-utils-2:4.6-7.el8.x86_64                                                   
  rpm-4.14.2-9.el8.x86_64                                                           
  libtasn1-4.13-3.el8.x86_64                                                        
  libattr-2.4.48-3.el8.x86_64                                                       
  libmetalink-0.1.3-7.el8.x86_64                                                    
  pkgconf-pkg-config-1.4.2-1.el8.x86_64                                             
  libnghttp2-1.33.0-1.el8.x86_64                                                    
  pcre-8.42-4.el8.x86_64                                                            
  bzip2-libs-1.0.6-26.el8.x86_64                                                    
  cpio-2.12-8.el8.x86_64                                                            
  mpfr-3.1.6-1.el8.x86_64                                                           
  acl-2.2.53-1.el8.x86_64                                                           
  bash-4.4.19-7.el8.x86_64                                                          
  libgomp-8.2.1-3.5.el8.x86_64                                                      
  grub2-tools-minimal-1:2.02-66.el8.x86_64                                          
  libcap-2.25-9.el8.x86_64                                                          
  ncurses-libs-6.1-7.20180224.el8.x86_64                                            
  dbus-libs-1:1.12.8-7.el8.x86_64                                                   
  gnutls-3.6.5-2.el8.x86_64                                                         
  gettext-libs-0.19.8.1-14.el8.x86_64                                               
  audit-libs-3.0-0.10.20180831git0047a6c.el8.x86_64                                 
  pam-1.3.1-4.el8.x86_64                                                            
  libtirpc-1.1.4-3.el8.x86_64                                                       
  trousers-lib-0.3.14-2.el8.x86_64                                                  
  libgcc-8.2.1-3.5.el8.x86_64                                                       
  libunistring-0.9.9-3.el8.x86_64                                                   
  libkcapi-1.1.1-16_1.el8.x86_64                                                    
  openssl-1:1.1.1-8.el8.x86_64                                                      
  ncurses-base-6.1-7.20180224.el8.noarch                                            
  expat-2.2.5-3.el8.x86_64                                                          
  libmount-2.32.1-8.el8.x86_64                                                      
  xz-libs-5.2.4-3.el8.x86_64                                                        
  device-mapper-libs-8:1.02.155-6.el8.x86_64                                        
  libcroco-0.6.12-4.el8.x86_64                                                      
  iptables-libs-1.8.2-9.el8.x86_64                                                  
  cyrus-sasl-lib-2.1.27-0.3rc7.el8.x86_64                                           
  setup-2.12.2-1.el8.noarch                                                         
  lz4-libs-1.8.1.2-4.el8.x86_64                                                     
  crypto-policies-20181217-6.git9a35207.el8.noarch                                  
  kbd-legacy-2.0.4-8.el8.noarch                                                     
  libnsl2-1.2.0-2.20180605git4a062cf.el8.x86_64                                     
  libsemanage-2.8-5.el8.x86_64                                                      
  libverto-0.3.0-5.el8.x86_64                                                       
  device-mapper-8:1.02.155-6.el8.x86_64                                             
  libpkgconf-1.4.2-1.el8.x86_64                                                     
  util-linux-2.32.1-8.el8.x86_64                                                    
  publicsuffix-list-dafsa-20180723-1.el8.noarch                                     
  file-libs-5.33-8.el8.x86_64                                                       
  file-5.33-8.el8.x86_64                                                            
  ca-certificates-2018.2.24-6.el8.noarch                                            
  sed-4.5-1.el8.x86_64                                                              
  libgcrypt-1.8.3-2.el8.x86_64                                                      
  pkgconf-m4-1.4.2-1.el8.noarch                                                     
  nettle-3.4.1-1.el8.x86_64                                                         
  mailcap-2.1.48-3.el8.noarch                                                       
  redhat-logos-httpd-80.7-1.el8.noarch                                              
  os-prober-1.74-6.el8.x86_64                                                       
  xz-5.2.4-3.el8.x86_64                                                             
  findutils-1:4.6.0-20.el8.x86_64                                                   
  libuuid-2.32.1-8.el8.x86_64                                                       
  libsmartcols-2.32.1-8.el8.x86_64                                                  
  libacl-2.2.53-1.el8.x86_64                                                        
  basesystem-11-5.el8.noarch                                                        
  libfdisk-2.32.1-8.el8.x86_64                                                      
  libarchive-3.3.2-3.el8.x86_64                                                     
  elfutils-default-yama-scope-0.174-6.el8.noarch                                    
  pcre2-10.32-1.el8.x86_64                                                          
  ncurses-6.1-7.20180224.el8.x86_64                                                 
  libsepol-2.8-2.el8.x86_64                                                         
  dbus-common-1:1.12.8-7.el8.noarch                                                 
  libgpg-error-1.31-1.el8.x86_64                                                    
  libdb-utils-5.3.28-36.el8.x86_64                                                  
  elfutils-libs-0.174-6.el8.x86_64                                                  
  elfutils-libelf-0.174-6.el8.x86_64                                                
  kbd-misc-2.0.4-8.el8.noarch                                                       
  libpcap-14:1.9.0-1.el8.x86_64                                                     
  tzdata-2019a-1.el8.noarch                                                         
  kmod-libs-25-11.el8_0.2.x86_64                                                    
  p11-kit-0.23.14-5.el8_0.x86_64                                                    
  glibc-common-2.28-42.el8_0.1.x86_64                                               
  p11-kit-trust-0.23.14-5.el8_0.x86_64                                              
  systemd-pam-239-13.el8_0.3.x86_64                                                 
  systemd-239-13.el8_0.3.x86_64                                                     
  glibc-all-langpacks-2.28-42.el8_0.1.x86_64                                        
  glibc-2.28-42.el8_0.1.x86_64                                                      
  systemd-libs-239-13.el8_0.3.x86_64                                                
  kmod-25-11.el8_0.2.x86_64                                                         
  systemd-udev-239-13.el8_0.3.x86_64                                                

Complete!

```

Many more packages required than using the base image, but we have httpd and systemd but not other tools like yum or 100 other utilities.  

To set up `httpd` to start with systemd, we can use the container mount point like a normal `chroot`.

`chroot ${scratchmnt} systemctl enable httpd`{{execute T1}}

```
Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.
```

Configure the port map and set cmd to systemd

`buildah config --port 80 --cmd "/sbin/init" working-container`{{execute T1}}

Create an image from the working container

`buildah unmount working-container`{{execute T1}}

```
b0ace0c1867f080c790357dd0c606c6919c163c308065c2323d3ddc148740eb1
```

`buildah commit working-container el-httpd2`{{execute T1}}

```
Getting image source signatures
Copying blob sha256:273497ce3451052db7cc333d8e90c259314f9cb8d6d4f7a5b865656f65c24083
 162.17 MiB / 162.17 MiB [==================================================] 6s
Copying config sha256:a3c678a7d7c63edbac6e57a86da11ff4d916c0734bcbea9cfd55ae2b515275b9
 308 B / 308 B [============================================================] 0s
Writing manifest to image destination
Storing signatures
a3c678a7d7c63edbac6e57a86da11ff4d916c0734bcbea9cfd55ae2b515275b9
```

`podman images`{{execute T1}}

```
REPOSITORY                                 TAG      IMAGE ID       CREATED              SIZE
localhost/el-httpd2                        latest   a3c678a7d7c6   About a minute ago   505 MB
localhost/el-httpd1                        latest   744417d8acd7   2 hours ago          279 MB
```

`podman run -d -p 80:80 el-httpd2`{{execute T1}}

```
561019c2a69fd3826bcaf4a62240ba2b5edd542e664bd2fee0381da746d58d95
```

`podman ps`{{execute T1}}

```
CONTAINER ID  IMAGE                       COMMAND     CREATED         STATUS             PORTS               NAMES
561019c2a69f  localhost/el-httpd2:latest  /sbin/init  13 seconds ago  Up 13 seconds ago  0.0.0.0:80->80/tcp  suspicious_sammet
```


Inspecting the image, you can see there's only one layer since we executed all the commands directly against the mounted filesystem.  Look for the `rootfs` section in the JSON output.

`buildah inspect localhost/el-httpd2`{{execute T1}}

```
"rootfs": {
            "type": "layers",
            "diff_ids": [
                "sha256:6d0bba8b32ffa211bb78d415b96d67dd7955cb30b1f86555d9c9f0da9a914626"
            ]
        },
```
