require 'radius/auth'
require 'radius'
require 'radius/packet'

dict = RADIUS::Dictionary.new
dict << RADIUS::Attribute.new("User-Name", 1, :string)
dict << RADIUS::Attribute.new("User-Password", 2, :string)
client = RADIUS::Client.new(dict, "0.0.0.0:1812")
pap = RADIUS::PAP.new("username", "password", "secret")
request = RADIUS::AccessRequest.new(dict, pap)
request.identifier = 1
response = client.send(request)