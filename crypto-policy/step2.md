#Set crypto policies to FUTURE

Now imagine that the security team within your organization sends out a memo recommending using more stringent crypto policies to make it harder for attackers to break into the system. The security team is recommending disallowing SHA-1 signature algorithm, and RSA keys larger than 3071-bits. This means setting the crypto policy to FUTURE.

To further protect the security of the system, CSO team is recommending to set crypto policy to future
`update-crypto-policies --set FUTURE`{{execute T1}}

Now, verify that the crypto policy has been updated
`update-crypto-policies --show`{{execute T1}}

