#require './config/Parameters/params'
require './config/Parameters/params'
#require '../../../config/Parameters/params'
require 'mysql2'

class DatabaseIntegration


  def selectCodeVerification(msisdn)
    u=Parameters.new
    username_db1 = u.database_username
    password_db1 = u.database_password
    host_db1 = u.database_host
    client = Mysql2::Client.new(:host => host_db1, :username => username_db1, :password => password_db1)
    client.query("use mtsPortalWiFI", :cast => false)
    client.query("SELECT verificationcode FROM users_wifi WHERE msisdn=#{msisdn} ORDER BY time DESC LIMIT 1",:as => :array).each do |row|
      return row [0]
    end
  end

  def writeCodeVerification(userid, username, ipaddress, verificationcode, msisdn, reserv2 = "test2")
    u=Parameters.new

    username_db = u.database_username
    password_db = u.database_password
    host_db = u.database_host
    client = Mysql2::Client.new(:host => host_db, :username => username_db, :password => password_db)
#client = Mysql2::Client.new(:default_file => '/Config/database.yml', :default_group => 'client')
#result = client.query("SELECT * FROM table", :cast => false)
    client.query("use mtsPortalWiFI", :cast => false)
    currenttime=Time.now
    client.query("INSERT INTO users_wifi  (UserID, username, time, ipaddress, verificationcode, msisdn, reserv2) VALUES(#{userid}, #{username}, CURRENT_TIMESTAMP, #{ipaddress}, #{verificationcode}, #{msisdn}, #{reserv2})", :cast => false)
  end


end