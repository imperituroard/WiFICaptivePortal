require './lib/mts/SMSC/MTSsmsc'
require './lib/mts/Database/DatabaseIntegration'
require 'pru'
require 'rubygems'
class WiFIPortalProcedures

  def checkVerificationCode

  end


  def sendVerificationSMS(msisdn)
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
        df=MTSsmsc.new
        df.startSMSC(25,'MTS.WiFI', msisdn,"Your verification code for MTS WiFI: #{code}")
        ipaddr="172242246"
        usern ="username"
        id = rand(999999999999)+1+2
        db=DatabaseIntegration.new
        db.writeCodeVerification(id, usern, ipaddress=ipaddr, code, msisdn, "reserv2")
    #else

   # end
  end





end