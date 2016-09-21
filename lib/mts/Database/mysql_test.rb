require 'mysql2'
#https://github.com/brianmario/mysql2
require '../../../config/Parameters/params'

u=Parameters.new
username = u.database_username
password = u.database_password
host = u.database_host

client = Mysql2::Client.new(:host => host, :username => username, :password => password)
#client = Mysql2::Client.new(:default_file => '/Config/database.yml', :default_group => 'client')
#result = client.query("SELECT * FROM table", :cast => false)
client.query("use test", :cast => false)
result = client.query("SELECT ard FROM test", :cast => false)
#headers = result.fields
puts result.count