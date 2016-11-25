require '../../../lib/mts/SSH/MTS_AAA_SSH'


fgdfgd=MTSssh.new
#fgdfgd.carcommand("/tmp/scriptPortalWIFI.sh")
#fgdfgd.carcommand("cd")
df= fgdfgd.carcommand("100.71.120.7")
df1=df.split
puts df1
#sleep 2
#fgdfgd.carcommand("query-sessions /r with-Attribute Framed-IP-Address 100.71.120.6 send-CoA with-profile iWAG-logon")