#require '../../../lib/mts/Database/DatabaseIntegration'
require '../../../lib/mts/SSH/MTS_AAA_SSH'

sss=MTSssh.new
sss.carcommand_autorize("100.71.112.73","375298766719","5555")
#ddd = DatabaseIntegration.new
#ddd.addText("6","1","Отправить")
#ddd.checkifSMSwasSend("134.17.0.18")
#p ddd.readTextPortal(1,1)