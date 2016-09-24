
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

    load File.dirname(__FILE__) + '/test_helper.rb'

    describe "Test Suite" do
      include TestHelper

      before(:all) do
        @browser = $browser = Selenium::WebDriver.for(browser_type)
        @browser.navigate.to(site_url)

        @base_url = "http://url/"
        @accept_next_alert = true

        @verification_errors = []
      end

      after(:all) do
        @browser.quit unless debugging?
      end

      it "New Test Case" do


        @browser.find_element(:name, "user_login").send_keys("root")
        @browser.find_element(:name, "user_pass").send_keys("1111")
        @browser.find_element(:name, "phrase").send_keys("FFFFFF")
        @browser.find_element(:xpath,"//input[@value='Вход']").click
        driver.get "http://URL"
        @browser.find_element(:name, "title").send_keys("Тест3")
        @browser.find_element(:name, "text").send_keys("тестовый тест")
        @browser.find_element(:xpath,"//input[@value='Запись']").click
        driver.get "http://URL"
        @browser.find_element(:css, "html body table tbody tr td table tbody tr td a:nth-child(2)").click

      end
    end



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
      cod=df.sendVerificationSMS(@phone_input, request.remote_ip)
if cod == 1

 end
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
