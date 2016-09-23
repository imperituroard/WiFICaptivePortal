require 'mysql2'
require '../../../config/Parameters/params'

u=Parameters.new
username_db = u.database_username
password_db = u.database_password
host_db = u.database_host

client = Mysql2::Client.new(:host => host_db, :username => username_db, :password => password_db)
#client = Mysql2::Client.new(:default_file => '/Config/database.yml', :default_group => 'client')
#result = client.query("SELECT * FROM table", :cast => false)
#, PRIMARY KEY (UserID)
client.query("CREATE  DATABASE IF NOT EXISTS mtsPortalWiFI", :cast => false)
client.query("USE mtsPortalWiFI", :cast => false)
client.query("CREATE TABLE IF NOT EXISTS users_wifi (UserID INT NOT NULL, username  VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci, time TIMESTAMP, ipaddress VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci, verificationcode VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci, msisdn VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci, reserv2 VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci)", :cast => false)