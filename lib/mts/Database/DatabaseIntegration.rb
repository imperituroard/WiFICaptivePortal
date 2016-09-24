#require './config/Parameters/params'
require './config/Parameters/params'
#require '../../../config/Parameters/params'
require 'mysql2'

class DatabaseIntegration


  def selectCodeVerification(ipaddress)
    u=Parameters.new
    username_db1 = u.database_username
    password_db1 = u.database_password
    host_db1 = u.database_host
    client = Mysql2::Client.new(:host => host_db1, :username => username_db1, :password => password_db1)
    client.query("use mtsPortalWiFI", :cast => false)
    client.query("SELECT verificationcode FROM users_wifi WHERE ipaddress=INET_NTOA('#{ipaddress}') ORDER BY time DESC LIMIT 1",:as => :array).each do |row|
      return row [0]
    end
  end

  def writeCodeVerification(userid, ipaddress, verificationcode, msisdn, reserv2 = "test2")
    u=Parameters.new

    username_db = u.database_username
    password_db = u.database_password
    host_db = u.database_host
    client = Mysql2::Client.new(:host => host_db, :username => username_db, :password => password_db)
#client = Mysql2::Client.new(:default_file => '/Config/database.yml', :default_group => 'client')
#result = client.query("SELECT * FROM table", :cast => false)
    client.query("use mtsPortalWiFI", :cast => false)
    currenttime=Time.now
    client.query("INSERT INTO users_wifi  (UserID, time, ipaddress, verificationcode, msisdn, reserv2) VALUES(#{userid}, CURRENT_TIMESTAMP, INET_ATON('#{ipaddress}'), #{verificationcode}, #{msisdn}, #{reserv2})", :cast => false)
  end


end