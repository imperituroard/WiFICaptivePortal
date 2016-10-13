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
client.query("CREATE TABLE IF NOT EXISTS users_wifi (UserID INT NOT NULL, time TIMESTAMP, ipaddress INT(10) unsigned NOT NULL default '0', verificationcode VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci, msisdn VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci, reserv2 VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci)", :cast => false)
client.query("CREATE TABLE IF NOT EXISTS texts_Portal_wifi (TextID INT NOT NULL, organizationID INT NOT NULL, textPage VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci, Description VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci)", :cast => false)
