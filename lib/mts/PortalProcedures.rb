require './lib/mts/SMSC/MTSsmsc'
require './lib/mts/Database/DatabaseIntegration'
require '../../lib/mts/SSH/MTS_AAA_SSH'
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
   # msisdn.to_s
   # p num = msisdn.gsub!('+','')
   # l = 12#num.to_s.length
   # puts l
    #puts request.remote_ip
    #beginnum = num[0] + num[1] + num[2]
    #beginnum1 = num[0].to_s + num[1].to_s
   # beginnum1=beginnum="375"

    #if (beginnum == "375" && l == 12) or (beginnum1 == "80" && l == 11)
        #subs_msisdn = msisdn.gsub!('+','')
        code = rand(9999999)
        $verificationcode=code
        df=MTSsmsc.new
        df.startSMSC(25,'MTS.WiFI', msisdn,"Your verification code for MTS WiFI: #{code}")
        ipaddr="172242246"
        usern ="username"
        id = rand(999999999999)+1+2
        db=DatabaseIntegration.new
        db.writeCodeVerification(id, usern, remoteip, code, msisdn, "reserv2")
    #else

   # end
  end





end