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
    sended_code_from_db=db.selectCodeVerification(ipaddress)
    if verifinputcode == sended_code_from_db
      sshauth=MTSssh.new
      sshauth.carcommand(ipaddress)
      return 0
    else
      return 1
      end

  end


  def sendVerificationSMS(msisdn, remoteip)
    check=AdditionalMethods.new
    msisdn=check.msisdnverification(msisdn)
    if msisdn != 1
        code = rand(9999999)
        $verificationcode=code
        df=MTSsmsc.new
        df.startSMSC(25,'MTS.WiFI', msisdn,"Your verification code for MTS WiFI: #{code}")
        id = rand(999999999999)+1+2
        db=DatabaseIntegration.new
        db.writeCodeVerification(id, remoteip, code, msisdn, "reserv2")
      else return 1
    end
  end





end