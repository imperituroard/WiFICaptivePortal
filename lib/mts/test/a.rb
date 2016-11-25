require '../../../config/Parameters/params'
require 'mysql2'

u=Parameters.new

username_db = u.database_username
password_db = u.database_password
host_db = u.database_host
client = Mysql2::Client.new(:host => host_db, :username => username_db, :password => password_db)
#client = Mysql2::Client.new(:default_file => '/Config/database.yml', :default_group => 'client')
#result = client.query("SELECT * FROM table", :cast => false)
client.query("use mtstest", :cast => false)
ip ="'127.0.0.1'"
client.query("INSERT INTO users_wifi  (ip) VALUES(INET_ATON(#{ip}))", :cast => false)