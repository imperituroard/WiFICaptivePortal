require './lib/mts/SMSC/MTSsmsc'
require './lib/mts/Database/DatabaseIntegration'
#require '../../lib/mts/SSH/MTS_AAA_SSH'
require './lib/mts/SSH/MTS_AAA_SSH'
#require '../../../lib/mts/AdditionalMethods'
require './lib/mts/AdditionalMethods'
require './lib/mts/SOAP/cps_procedures'
require 'pru'
require 'rubygems'
class WiFIPortalProcedures

  def checkVerificationCode(ipaddress, verifinputcode)
    db=DatabaseIntegration.new
     sended_code_from_db=db.selectCodeVerification(ipaddress)
    #sended_code_from_db=sended_code_from_db.to_s
  p  msisdn= db.selectMsisdnVerification(ipaddress)
     "from_db" + sended_code_from_db[0].to_s
    if verifinputcode == sended_code_from_db
      #uncomment when start procedures to car
      threadcar_success = Thread.new do
        #region CPSauthorize
    #   cpsauth=CPS_procedures.new
   #  p  cpsauth.ExecuteActionRequest_UserLogon(msisdn,ipaddress, verifinputcode, "172.24.207.41")
        #endregion
        #region carauthorize
       sshauth=MTSssh.new
       sleep 3
       sshauth.carcommand_autorize(ipaddress,msisdn,verifinputcode)
       #endregion
       # sshauth.carcommand_logon(ipaddress)
       # sleep 1
     #  p sshauth.carcommand_logon1(ipaddress)
        puts "dfgdfg"
       db.updateVerification(ipaddress)
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

    check=AdditionalMethods.new
    msisdn=check.verify_msisdn(msisdn)
    if msisdn != 1
       rnd = Random.new
       code = rnd.rand(1000..9999)
       # code = rand(9999)
        $verificationcode=code
        thread_sms = Thread.new do
          ddd1 = DatabaseIntegration.new
          db_text=ddd1.readTextPortal(4,1)
          db_alphanumber=ddd1.readTextPortal(7,1)
        df=MTSsmsc.new
         textmessage =  "#{db_text}" + "#{code}"
     #  p   message =textmessage.encode("UTF-2BE").force_encoding("BINARY")
        df.startSMSC(25, db_alphanumber, msisdn, textmessage)
        id = rand(999999999999)+1+2
        db=DatabaseIntegration.new
        db.writeCodeVerification(id, remoteip, code, msisdn, 0)
        end
      else return 1
    end
      end
  end





end