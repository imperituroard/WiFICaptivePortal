#require './config/Parameters/params'
require './config/Parameters/params'
#require '../../../config/Parameters/params'
require 'mysql2'

class DatabaseIntegration


  def selectCodeVerification(ipaddress)
    p "ip" + ipaddress
    u=Parameters.new
    username_db1 = u.database_username
    password_db1 = u.database_password
    host_db1 = u.database_host
    client = Mysql2::Client.new(:host => host_db1, :username => username_db1, :password => password_db1)
    client.query("use mtsPortalWiFI", :cast => false)
    client.query("SELECT verificationcode FROM users_wifi WHERE ipaddress=INET_ATON('#{ipaddress}') and time >=DATE_SUB(NOW(), INTERVAL 15 MINUTE) ORDER BY time DESC LIMIT 1",:as => :array).each do |row|
      client.close
      p "row" + row[0]
      return row [0]
    end
  end

  def selectMsisdnVerification(ipaddress)
    p "ip" + ipaddress
    u=Parameters.new
    username_db1 = u.database_username
    password_db1 = u.database_password
    host_db1 = u.database_host
    client = Mysql2::Client.new(:host => host_db1, :username => username_db1, :password => password_db1)
    client.query("use mtsPortalWiFI", :cast => false)
    client.query("SELECT msisdn FROM users_wifi WHERE ipaddress=INET_ATON('#{ipaddress}') ORDER BY time DESC LIMIT 1",:as => :array).each do |row|
      client.close
      p "row" + row[0]
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
    client.close
  end

  def addText(id, company_id, text, description)
    u=Parameters.new
    username_db = u.database_username
    password_db = u.database_password
    host_db = u.database_host
    client = Mysql2::Client.new(:host => host_db, :username => username_db, :password => password_db)
    client.query("use mtsPortalWiFI", :cast => false)
    client.query("INSERT INTO texts_Portal_wifi  (TextID, organizationID, textPage, Description) VALUES(#{id}, #{company_id}, '#{text}', '#{description}' )")
    client.close
  end

  def readTextPortal(id, company_id)
    u=Parameters.new
    username_db = u.database_username
    password_db = u.database_password
    host_db = u.database_host
    client = Mysql2::Client.new(:host => host_db, :username => username_db, :password => password_db)
    client.query("use mtsPortalWiFI", :cast => false)
    client.query("SELECT textPage FROM texts_Portal_wifi WHERE TextID='#{id}' and organizationID='#{company_id}' LIMIT 1",:as => :array).each do |row|
      client.close
      p "row" + row[0]
      return row[0]
    end
  end

  def checkifSMSwasSend(ipaddress)
    p "hhyj555555"
    p "ip" + ipaddress
    u=Parameters.new
    username_db1 = u.database_username
    password_db1 = u.database_password
    host_db1 = u.database_host
    client = Mysql2::Client.new(:host => host_db1, :username => username_db1, :password => password_db1)
    client.query("use mtsPortalWiFI", :cast => false)
    dffd1= client.query("SELECT verificationcode FROM users_wifi WHERE ipaddress=INET_ATON('#{ipaddress}') and time >=DATE_SUB(NOW(), INTERVAL 5 MINUTE) ORDER BY time DESC LIMIT 1",:as => :array).each do |row|
      client.close
      p row[0]
      if row[0].length ==4
            return '3'
        else return nil
      end
      #Mysql2::Client#close
    end
  end




end