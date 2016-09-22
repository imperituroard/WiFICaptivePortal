require '../../../config/Parameters/params'



class DatabaseIntegration


  def selectCodeVerification(ipaddress,abonehash)
    u=Parameters.new
    username_db = u.database_username
    password_db = u.database_password
    host_db = u.database_host
    client = Mysql2::Client.new(:host => host_db, :username => username_db, :password => password_db)
#client = Mysql2::Client.new(:default_file => '/Config/database.yml', :default_group => 'client')
#result = client.query("SELECT * FROM table", :cast => false)
    client.query("use test", :cast => false)
    result = client.query("SELECT ard FROM test", :cast => false)
  end

  def writeCodeVerification(userid, username, ipaddress, verificationcode)
    u=Parameters.new
    username_db = u.database_username
    password_db = u.database_password
    host_db = u.database_host
    client = Mysql2::Client.new(:host => host_db, :username => username_db, :password => password_db)
#client = Mysql2::Client.new(:default_file => '/Config/database.yml', :default_group => 'client')
#result = client.query("SELECT * FROM table", :cast => false)
    client.query("use mtsPortalWiFI", :cast => false)
    currenttime=Time.now
    client.query("INSERT INTO users_wifi  (UserID, username, time, ipaddress, verificationcode) VALUES(#{userid}, #{username}, #{currenttime},#{ipaddress}, #{verificationcode})", :cast => false)
  end


end