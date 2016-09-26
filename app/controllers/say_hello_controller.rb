
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

  end


  def MTS_A_start_page
    @phone = params["phone_number"]
    @phone_input=@phone
  end

  def MTS_check_msisdn_and_send_sms

    @phone = params["phone_number"]
    @phone_input=@phone
    if @phone_input != nil
      df = WiFIPortalProcedures.new
      cod=df.sendVerificationSMS(@phone_input, request.remote_ip)
      if cod == 1

      end

    end
  end

  def MTS_input_and_verify_code_success
    @verif = params["verifcode"]
    puts @verif
    @verif_input=@phone
    #redirect_to 'say_hello/verifycode'
    #p @phone.remote_ip

    #require 'SMS'
    #@phone_number=@phone_output
    @title = "all work"
    #redirect_to 'http://www.google.com'

    if @verif != nil
      ad = WiFIPortalProcedures.new
      ard = ad.checkVerificationCode(request.remote_ip, @verif)
      if ard !=0
        redirect_to '/say_hello/MTS_check_msisdn_and_send_sms'
        @phone_input="incorrect verification code"
      end
    else
      redirect_to '/say_hello/MTS_check_msisdn_and_send_sms'
      @phone_input="put your verification code"
    end

    #if @verif_input != nil
    #else
    #  redirect_to 'say_hello/MTS_end_if_failed_auth_or_code_incorrect'
    #end
  end


  def MTS_end_if_failed_auth_or_code_incorrect

  end



end
