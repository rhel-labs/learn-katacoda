# Goal:
After completing this scenario, users will be able to use, and 
customize Red Hat Enterprise Linux's system-wide cryptographic policy.  
The scenario uses the Apache web server as the example application.

# Concepts included in this scenario:
* Verify the current system-wide cryptographic policy setting
* Customize the current cryptographic policy setting
* Restart applications after a cryptographic policy update
* Verify that the application settings to comply with the modified cryptograpic policies

# Example Use case:
Your security team requires using stronger cryptography algorithms that provide 
forward secrecy. This means that RSA and PSK cipher keys are not accepted. In this 
example we will be generating an ECC (Elliptic Curve Cryptography Key) for this purpose. 
