require 'mysql2'
#https://github.com/brianmario/mysql2
require '../../../config/Parameters/params'

u=Parameters.new
username_db = u.database_username
password_db = u.database_password
host_db = u.database_host

client = Mysql2::Client.new(:host => host_db, :username => username_db, :password => password_db)
#client = Mysql2::Client.new(:default_file => '/Config/database.yml', :default_group => 'client')
#result = client.query("SELECT * FROM table", :cast => false)
client.query("use test", :cast => false)
result = client.query("SELECT ard FROM test", :cast => false)
#headers = result.fields
puts result.count