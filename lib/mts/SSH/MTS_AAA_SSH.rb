require 'net/ssh'
require '../../../config/Parameters/params'

class MTSssh

  def carcommand(ipaddr)
    conf = Parameters.new
    host_car = conf.carSSH_host
    username_car = conf.carSSH_username
    password_car = conf.carSSH_password
    Net::SSH.start(host_car, username_car, :password => password_car) do |ssh|
      result = ssh.exec!("/opt/CSCOar/bin/aregcmd -s query-sessions /radius with-Attribute Framed-IP-Address #{ipaddr} send-CoA with-profile iWAG-logon")
      #puts result
      return result
    end
  end
end