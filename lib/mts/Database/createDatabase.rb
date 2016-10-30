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
client.query("CREATE TABLE IF NOT EXISTS users_wifi (UserID INT NOT NULL, time TIMESTAMP, ipaddress INT(10) unsigned NOT NULL default '0', verificationcode VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci, msisdn VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci, auth_state BIT)", :cast => false)
client.query("CREATE TABLE IF NOT EXISTS texts_Portal_wifi (TextID INT NOT NULL, organizationID INT NOT NULL, textPage VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci, Description VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci)", :cast => false)
client.query("CREATE TABLE IF NOT EXISTS parameters_Portal_wifi (ParameterID INT NOT NULL, organizationID INT NOT NULL, ParameterVALUE VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci, Description VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci)", :cast => false)
client.query("CREATE TABLE IF NOT EXISTS List_mikroTik_eoip_tunnels (AP_ID INT NOT NULL, Phone_number VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci, EoIP_ID INT(5), SIM_ip VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_general_ci, bridge_ip_at_AP_site VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_general_ci, tunnel_name_at_hub_site VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci, MikroTik_hub_ip VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_general_ci,  state VARCHAR(5) CHARACTER SET utf8 COLLATE utf8_general_ci, IWAG_gateway_ip VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_general_ci, subscribers_network_mask INT(12), tunnel_name_at_ap_site VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci, bridge_name_at_hub_site VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci, bridge_name_at_ap_site VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci, bridge_ip_at_hub_site VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_general_ci, company_name VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci, ap_address VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci, contacts VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci)", :cast => false)
