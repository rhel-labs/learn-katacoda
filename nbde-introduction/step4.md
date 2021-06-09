
# Binding the encrypted devices to `tang`

## Execute `clevis luks bind`

To bind the encrypted devices to `tang`, we will have to issue a `clevis luks bind` command for every encrypted device we have. We will also need the IP address of our tang server, which is `192.168.122.1`.

In the previous step, we identified the following encrypted device:

- `/dev/vda2`

Let's now bind this device to our `tang` server. We can do it by issuing the following command:

`clevis luks bind -d /dev/vda2 tang '{"url":"192.168.122.1"}'`{{execute}}

Breaking down the previous command, we have the following:
- the encrypted device -- indicated with `-d /dev/vda2`
- the type of binding we want to do -- `tang`, in this case
- the `tang` configuration we are using, that contains the address of the `tang` server -- `{"url":"192.168.122.1"}`. Note that this configuration is specified in a JSON format.

After entering the previous command, it will:

1. prompt you for an existing LUKS password -- use `katacoda`
2. Inform you that the advertisement contains a given signing key and ask you to accept it -- please press `y` and `<enter>`


| Enter existing LUKS password: | Do you wish to trust these keys? [ynYN] |
|-------------------------------|-----------------------------------------|
|`katacoda`{{execute}}          | `y`{{execute}}                          |


If all goes well, you will not see any further output.

## Checking whether our binding was actually created

To verify whether the previous command really created a binding with our `tang` server, we use the `clevis luks list`
command. Similar to `clevis luks bind`, we need to also specify the device we are interested to get more information
about with the `-d` parameter.

So, to check whether there are any `clevis` bindings in our `/dev/vda2` device, please issue the following command:

`clevis luks list -d /dev/vda2`{{execute}}

You should see the following output:

```
1: tang '{"url":"192.168.122.1"}'
```

This means that slot `#1` of LUKS device `/dev/vda2` has a `tang` binding with the displayed
configuration -- i.e., the `tang` server it is bound to has address `192.168.122.1`.
