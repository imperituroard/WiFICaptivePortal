require '../../../lib/mts/Database/DatabaseIntegration'
require '../../../config/Parameters/params'
require 'mysql2'

#db=DatabaseIntegration.new
#sleep 1
gh = DatabaseIntegration.new
der=gh.selectCodeVerification(msisdn=375298766719)
puts der
#currenttime="2016-12-12 12:12:12"#Time.now
#puts currenttime
#result.each_hash {|h| puts h['verificationcode']}
#u=Parameters.new

#username_db = u.database_username
#password_db = u.database_password
#host_db = u.database_host
#client = Mysql2::Client.new(:host => host_db, :username => username_db, :password => password_db)
#client = Mysql2::Client.new(:default_file => '/Config/database.yml', :default_group => 'client')
#result = client.query("SELECT * FROM table", :cast => false)
#client.query("use mtstest", :cast => false)
#currenttime=Time.now
#client.query("INSERT INTO time  (time) VALUES(CURRENT_TIMESTAMP)", :cast => false)
