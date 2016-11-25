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
client.query("CREATE  DATABASE IF NOT EXISTS mtstest", :cast => false)
client.query("USE mtstest", :cast => false)
client.query("CREATE TABLE IF NOT EXISTS users_wifi (ip INT unsigned)", :cast => false)