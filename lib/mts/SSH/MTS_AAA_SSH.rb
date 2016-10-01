require 'net/ssh'
#require '../../../config/Parameters/params'
require './config/Parameters/params'
class MTSssh

  def carcommand_logon(ipaddr)
    conf = Parameters.new
    host_car = conf.carSSH_host
    username_car = conf.carSSH_username
    password_car = conf.carSSH_password
    Net::SSH.start(host_car, username_car, :password => password_car) do |ssh|
      result = ssh.exec!("/opt/CSCOar/bin/aregcmd -s query-sessions /radius with-Attribute Framed-IP-Address #{ipaddr} send-CoA with-profile iWAG-logon")
      #puts result
      return result
      Net::SSH.stop
    end
  end

  def carcommand_logon1(ipaddr)
    conf = Parameters.new
    host_car = conf.carSSH_host
    username_car = conf.carSSH_username
    password_car = conf.carSSH_password
    Net::SSH.start(host_car, username_car, :password => password_car) do |ssh|
      result = ssh.exec!("/opt/CSCOar/bin/aregcmd -s query-sessions /radius with-Attribute Framed-IP-Address #{ipaddr} send-CoA with-profile iWAG-logon-1")
      #puts result
      return result
      Net::SSH.stop
      sleep 1
    end
  end

  def carcommand_logoff(ipaddr)
    conf = Parameters.new
    host_car = conf.carSSH_host
    username_car = conf.carSSH_username
    password_car = conf.carSSH_password
    Net::SSH.start(host_car, username_car, :password => password_car) do |ssh|
      result = ssh.exec!("/opt/CSCOar/bin/aregcmd -s query-sessions /radius with-Attribute Framed-IP-Address #{ipaddr} send-CoA with-profile iWAG-logoff")
      #puts result
      return result
      Net::SSH.stop
      sleep 1
    end
  end
end