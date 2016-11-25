#!/usr/local/bin/ruby
#
# Sample RADIUS client using the new Radius::Auth class
#
# This code is provided for illustrative purposes only and is placed
# in the public domain.
#
# $Id: rclient.rb 2 2006-12-17 06:16:21Z dido $
#
require 'radius/auth'

auth = Radius::Auth.new('../dictionary', '172.24.207.33', 5)
secret = 'h1dd3n'
print "login: "
user = $stdin.readline
user.chomp!
print "Password: "
pass = $stdin.readline
pass.chomp!
if (auth.check_passwd(user, pass, secret, '172.24.207.33'))
  print "Authentication successful.\n"
else
  print "Authentication failed.\n"
end