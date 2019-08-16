#!/usr/bin/python
import sys
import os
import xmlrpclib
import httplib
import ssl

def main():
    username='rhel-katacoda'
    password='RedHat1!'

    context = hasattr(ssl, '_create_unverified_context') and ssl._create_unverified_context() or None
    s = xmlrpclib.Server('https://xmlrpc.rhn.redhat.com/rhn/rpc/api', 
                          verbose=False, use_datetime=True, 
                          transport=xmlrpclib.SafeTransport(use_datetime=True,
                                                            context=context))

    try:
        token = s.auth.login(username, password)
    except xmlrpclib.Fault, e:
        print 'Fault caught at login'
        print '  Code: %d' % e.faultCode
        print '  Message: ' + e.faultString
        return

    print "Should succeed:"
    details = {
      'login'      : 'rhel-410c',
      'email'      : 'noreply@redhat.com',
      'address1'   : '100 E. Davie St.',
      'address2'   : '',
      'city'       : 'Raleigh',
      'country'    : 'US',
      'first_names': 'Insights',
      'last_name'  : 'User',
      'prefix'     : 'Mr.',
      'password'   : 'redhat',
      'phone'      : '1111111111',
      'state'      : 'NC',
      'zip'        : '27601' }
    try:
        rc = s.user.createUser(token, details)
        print "Result [ %d ]" % rc
    except xmlrpclib.Fault, e:
        print 'Fault caught at createUser'
        print '  Code: %d' % e.faultCode
        print '  Message: ' + e.faultString
    print

if __name__ == "__main__":
    main()
