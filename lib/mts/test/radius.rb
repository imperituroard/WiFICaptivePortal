require 'ruby-radius'

user_radius = UserRadius.insert(
    username: "RADIUS_USERNAME",
    attribute: 'Cleartext-Password', # I've also tried using "Password"
    op: '==', # I've also tried using ":="
    value: "RADIUS_PASSWORD")

#Sending Access-Request of id 30 to 127.0.0.1 port 1812
#User-Name = "RADIUS_USERNAME"
#User-Password = "RADIUS_PASSWORD"
#NAS-IP-Address = 8.8.8.8
#NAS-Port = 1812
#Message-Authenticator = 0x00000000000000000000000000000000
#rad_recv: Access-Accept packet from host 127.0.0.1 port 1812, id=30, length=20