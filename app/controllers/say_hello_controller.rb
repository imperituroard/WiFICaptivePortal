
#http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-telephone_field_tag
#http://rusrails.ru/rails-form-helpers#understanding-parameter-naming-conventions
#require 'rubygems'
#require 'smpp'
#require '../../lib/mts/SMSC/sms_samplegateway'
#require '../../config/Parameters/params'
#require '../../lib/mts/SMSC/KeyboardHandler'
load  './lib/mts/PortalProcedures.rb'
require 'smpp'
require 'savon'
require 'openssl'
require 'rubygems'
require 'nokogiri'
require './lib/mts/CPS/cps_procedures'
#require './lib/mts/SMSC/sms_samplegateway'

require 'rubygems'
require 'action_pack'
#require './config/Parameters/params'
#require './lib/mts/SMSC/KeyboardHandler'

#LOGFILE = File.dirname(__FILE__) + "/sms_gateway.log"
##Smpp::Base.logger = Logger.new(LOGFILE)


class SayHelloController < ApplicationController

  @phone_input
  @phone_output


  def say
    @phone = params["phone_number"]

    @phone_input=@phone
    #p @phone.remote_ip

    #require 'SMS'
    #@phone_number=@phone_output

    if @phone_input != nil
      #df=CPS_procedures.new
      #puts @phone_input
      #fe = df.GetSubscriber(@phone_input)
      #param_smsc = Parameters.new
      #config = param_smsc.smsc
      #gw = SampleGateway.new
      #gw.start(config)
      #@phone_number=fe

      df = WiFIPortalProcedures.new
      #df.sendVerificationSMS(@phone_input)
      #Url::to(['/products/index', 'id' => $someId])

    end

  end

  def sum
    @phone = params["phone_number"]

    @phone_input=@phone
    #p @phone.remote_ip

    #require 'SMS'
    #@phone_number=@phone_output

    if @phone_input != nil
      #df=CPS_procedures.new
      #puts @phone_input
      #fe = df.GetSubscriber(@phone_input)
      #param_smsc = Parameters.new
      #config = param_smsc.smsc
      #gw = SampleGateway.new
      #gw.start(config)
      #@phone_number=fe

      df = WiFIPortalProcedures.new
      df.sendVerificationSMS(@phone_input, request.remote_ip)

      as = request.remote_ip
      ba = request.env["REMOTE_ADDR"]
      p "as = " + as
      p "ba = " + ba
    end

  end


  def verifycode
    @verif = params["verifcode"]
    puts @verif

    @verif_input=@phone
    #p @phone.remote_ip

    #require 'SMS'
    #@phone_number=@phone_output

    if @verif_input != nil
      #df=CPS_procedures.new
      #puts @phone_input
      #fe = df.GetSubscriber(@phone_input)
      #param_smsc = Parameters.new
      #config = param_smsc.smsc
      #gw = SampleGateway.new
      #gw.start(config)
      #@phone_number=fe

      df = WiFIPortalProcedures.new
      df.checkVerificationCode()
    end
  end



end
