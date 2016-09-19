require 'mysql2'
#https://github.com/brianmario/mysql2

client = Mysql2::Client.new(:host => "134.17.0.25", :username => "imperituroard", :password => "FdE3G5jQ89mef2mj03H1Bf789")
#client = Mysql2::Client.new(:default_file => '/Config/database.yml', :default_group => 'client')
#result = client.query("SELECT * FROM table", :cast => false)
client.query("use test", :cast => false)
result = client.query("SELECT ard FROM test", :cast => false)
#headers = result.fields
puts result.count