require 'net-telnet'
require './config/Parameters/params'
#min11asr1_thread = Thread.new do

#n = Net::Telnet::new()
#blk = proc { |str| $stderr << str }
#n.login("user", "password", &blk)
#n.cmd("show users", &blk)
class MTStelnet

  def return_iwag_access_interface(ipaddress)
    conf = Parameters.new
    host_iwag = conf.iwag_host
    username_iwag = conf.iwag_username
    password_iwag = conf.iwag_password

    dump =""
    connection = Net::Telnet.new( "Host" => host_iwag, "Timeout" => false, "Prompt" => /.*\#/ ) { |str| print str }
    connection.login({ "Name" => username_iwag, "Password" => password_iwag, "LoginPrompt" => /Username:/ }) { |str| print str }
    connection.cmd("show ip dhcp binding #{ipaddress}") {
        |c|
      dump << c
    }
    connection.close
    as = dump.split("\n")
    if as[4] != nil
    p as[4]
    access_interface = as[4].gsub!("  ","").split(" ").last
    return access_interface
    else
      return "false"
    end

  end


end

#localhost = Net::Telnet::new("Host" => "172.24.184.183",
#                             "Timeout" => 30,
#"Prompt" => /[$%min11iwag1#] \z/n)
#dump =""
#localhost.login("imperituroard", "1029384756") {   }
#localhost.cmd("imperituroard")
#localhost.cmd("1029384756")
#localhost.cmd("show ip dhcp binding") {
#    |c|
#p c
#dump << c
#}
#localhost.close



#Net::SSH.start("172.24.184.183", "imperituroard", :password => "1029384756") do |ssh|
#  result = ssh.exec!("show subscriber session")
 # #puts result
 # return result
 # Net::SSH.stop
#end