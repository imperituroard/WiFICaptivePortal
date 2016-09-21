require 'mysql2'
require '../../../config/Parameters/params'

u=Parameters.new
username = u.database_username
password = u.database_password
host = u.database_host

client = Mysql2::Client.new(:host => host, :username => username, :password => password)
#client = Mysql2::Client.new(:default_file => '/Config/database.yml', :default_group => 'client')
#result = client.query("SELECT * FROM table", :cast => false)
client.query("CREATE  DATABASE IF NOT EXISTS mtsPortalWiFI", :cast => false)
client.query("USE mtsPortalWiFI", :cast => false)
client.query("CREATE TABLE IF NOT EXISTS users_wifi (UserID INT NOT NULL, username VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, time DATETIME,ipaddress VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci, verificationcode VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci, PRIMARY KEY (UserID))", :cast => false)