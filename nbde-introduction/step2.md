
# Setting up `tang`

To start setting up `tang`, go to the `Terminal`.
When the scenario is ready, you should see a prompt similar to this:

```
[root@tang /]#
```

## Installing and starting `tang`

We start by installing `tang`, which can be done by issuing the following command:

`dnf install -y tang`{{execute}}

Once the previous command completes, please start and enable `tang` with the following command:

`systemctl enable --now tangd.socket`{{execute}}

## Checking whether `tang` is responding properly

At this point, `tang` should be up and running, and we can verify this by issuing the following command, which will download a `tang` advertisement:

`curl localhost/adv`{{execute}}

We should see as output a JSON that looks like this:

```json
{"payload": "eyJrZXlz...", "protected": "eyJhbGciOiJFUzUxMiIsImN0eSI6Imp3ay1zZXQranNvbiJ9", "signature": "ACWDhcrj0fQxLS4sgVW7wsFryYMZgQVppDQALKHqMaJksH_RzJFPM8cOA24CUchLKpTjBG51hby9d_CesDYkb4BlAd4NafoLVSXq_YxaCdaItoEaGEAjCXMMFZIBJMqkVCoKtIK_3VUdZD3PqU4wQnfhhk2Tx_Vt1hZYpcKocoOzft2W"}
```

This indicates that the server is responding as expected.

Note that the actual values for the `payload` and other fields in the JSON will differ from
the example output displayed above.

## Opening the port used by `tang` in the firewall

Finally, we should make sure we can access `tang` from other machines, which means the port it is listening to should
be reachable from these other machines. By default, `tang` works on TCP port 80 -- the same as the HTTP protocol --, so
we can open it in our scenario by issuing the following command:

`firewall-cmd --add-port=80/tcp`{{execute}}

Note: depending on how the firewall is set up, the command to open a specific port may be slightly different, but for our
scenario the command above will suffice.

You can verify the port is open by issuing the next command:

`firewall-cmd --list-ports`{{execute}}

And the expected output here would be the following:

```
80/tcp
```
