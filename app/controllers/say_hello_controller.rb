
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
require './lib/mts/SOAP/cps_procedures'
#require '../../../lib/mts/Database/DatabaseIntegration'
require './lib/mts/Database/DatabaseIntegration'
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
  @verifcode_input
  #@number_form = "Введите ваш номер"


  def put_code_again
    redirect_to :controller => 'say_hello', :action => 'MTS_A_start_page'
  end


  def MTS_A_start_page
    ddd = DatabaseIntegration.new
    ds = ddd.checkifSMSwasSend(request.remote_ip)
    if  ds == '3'
      redirect_to '/say_hello/MTS_check_msisdn_and_send_sms' #:controller => 'say_hello', :action => 'MTS_check_msisdn_and_send_sms'
    end

  #region database load parameters
  @number_form = ddd.readTextPortal(1,1)
  @code_form = ddd.readTextPortal(2,1)
  @internet_form = ddd.readTextPortal(3,1)
  @text_yourphone = ddd.readTextPortal(5,1)
  @button_text = ddd.readTextPortal(6,1)
  @footer = ddd.readTextPortal(9,1)
  @alert_incorrectphone = ddd.readTextPortal(10,1)
  @russian_language = ddd.readTextPortal(11,1)
  @english_language = ddd.readTextPortal(12,1)
  @belorussian_language = ddd.readTextPortal(13,1)
  #endregion

  end

  def MTS_check_msisdn_and_send_sms
    ddd = DatabaseIntegration.new
    @number_form = ddd.readTextPortal(1,1)
    @code_form = ddd.readTextPortal(2,1)
    @internet_form = ddd.readTextPortal(3,1)
    @footer = ddd.readTextPortal(9,1)
    @phone = params["phone_number"]
    p @browser = params["browserdescription"]
    @phone_input=@phone
     "#{@phone_input}" + "phone"
    df = @phone_input
    if @phone_input != nil
      df = WiFIPortalProcedures.new

      cod=df.sendVerificationSMS(@phone_input, request.remote_ip)
      if cod == 1

      end
    end
  end

  def MTS_input_and_verify_code
    p "fgfd"
    ddd = DatabaseIntegration.new

    @number_form = ddd.readTextPortal(1,1)
    @code_form = ddd.readTextPortal(2,1)
    @internet_form = ddd.readTextPortal(3,1)
    @link_to_redirect = ddd.readTextPortal(8,1)
    @footer = ddd.readTextPortal(9,1)
   p @verificationcode_mts = params["verificationcode_mts"]
    @verif_input=@verificationcode_mts

    #require 'SMS'
    #@phone_number=@phone_output
  #  @title = "all work"
    #redirect_to 'http://www.google.com'
    p "hgfhfghgfhfgdhfhdfgh"
    if @verificationcode_mts != nil
      ad = WiFIPortalProcedures.new
      @verificationcode_mts
      request.remote_ip
      p ard = ad.checkVerificationCode(request.remote_ip, @verificationcode_mts)
      if ard ==1
        redirect_to :controller => 'say_hello', :action => 'MTS_end_if_failed_auth_or_code_incorrect'
       #redirect_to '/failed' #:action => 'say_hello', :controller => 'MTS_end_if_failed_auth_or_code_incorrect'
        @verificationcode_mts="incorrect verification code"
      else
       # thr=Thread.new() do
       #   sleep 10
        #  Launchy.open(@link_to_redirect)
        #end
        redirect_to '/say_hello/MTS_input_and_verify_code_success'
       # redirect_to '/success' #:action => 'say_hello', :controller => 'MTS_end_if_failed_auth_or_code_incorrect'

      end

    else
     redirect_to '/say_hello/MTS_check_msisdn_and_send_sms'
      @verificationcode_mts="put your verification code"
    end
  end


  def MTS_input_and_verify_code_success
   # redirect_to 'say_hello/MTS_end_if_failed_auth_or_code_incorrect'
    ddd = DatabaseIntegration.new

    @number_form = ddd.readTextPortal(1,1)
    @code_form = ddd.readTextPortal(2,1)
    @internet_form = ddd.readTextPortal(3,1)
   # @link_to_redirect = ddd.readTextPortal(8,1)
    @footer = ddd.readTextPortal(9,1)
    @word_success = ddd.readTextPortal(14,1)
    @you_may_use_an_internet = ddd.readTextPortal(15,1)
    @wate_for_redirect = ddd.readParameterPortal(1,1)
   # @verificationcode_mts = params["verificationcode_mts"]
   # @verif_input=@verificationcode_mts

    #if @verif_input != nil



  end


  def MTS_end_if_failed_auth_or_code_incorrect
   #region load from database
    ddd = DatabaseIntegration.new
    @number_form = ddd.readTextPortal(1,1)
    @code_form = ddd.readTextPortal(2,1)
    @internet_form = ddd.readTextPortal(3,1)
    @footer = ddd.readTextPortal(9,1)
    #endregion

  end



end
