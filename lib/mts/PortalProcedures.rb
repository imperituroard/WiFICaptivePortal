require './lib/mts/SMSC/MTSsmsc'
require './lib/mts/Database/DatabaseIntegration'
#require '../../lib/mts/SSH/MTS_AAA_SSH'
require './lib/mts/SSH/MTS_AAA_SSH'
#require '../../../lib/mts/AdditionalMethods'
require './lib/mts/AdditionalMethods'
require 'pru'
require 'rubygems'
class WiFIPortalProcedures

  def checkVerificationCode(ipaddress, verifinputcode)
    db=DatabaseIntegration.new
    p sended_code_from_db=db.selectCodeVerification(ipaddress)
    #sended_code_from_db=sended_code_from_db.to_s
    p "from_db" + sended_code_from_db[0].to_s
    if verifinputcode == sended_code_from_db
      #uncomment when start procedures to car
      threadcar_success = Thread.new do
        sshauth=MTSssh.new
        sshauth.carcommand_logon(ipaddress)
        sleep 1
        sshauth.carcommand_logon1(ipaddress)
        puts "dfgdfg"
        sleep 3
      end
      #redirect_to 'http://www.belorusneft.by'
      return 0
    else
      sshauth=MTSssh.new
      sshauth.carcommand_logoff(ipaddress)
      return 1
      end

  end


  def sendVerificationSMS(msisdn, remoteip)
    if msisdn != nil

    #check=AdditionalMethods.new
    #msisdn=check.msisdnverification(msisdn)
    if msisdn != 1
        code = rand(9999999)
        $verificationcode=code
        thread_sms = Thread.new do
        df=MTSsmsc.new
        df.startSMSC(25,'MTS.WiFI', msisdn,"Your verification code for MTS WiFI: #{code}")
        id = rand(999999999999)+1+2
        db=DatabaseIntegration.new
        db.writeCodeVerification(id, remoteip, code, msisdn, "reserv2")
        end
      else return 1
    end
      end
  end





end