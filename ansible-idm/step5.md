# IPA Healthcheck

IPA is not a single daemon. It is a collection of services configured to work together.

The *healthcheck* tool can be used to  verify if a system is properly configured, as well as, find and report error conditions that may impact the IPA environment.

## Run a IPA healthcheck

`ipa-healthcheck --failures-only`{{execute}}

The *--failures-only* option can be used to only show failures in the environment. 
