
#http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-telephone_field_tag
#http://rusrails.ru/rails-form-helpers#understanding-parameter-naming-conventions
#require 'rubygems'
#require 'smpp'
#require '../../lib/mts/SMSC/sms_samplegateway'
#require '../../config/Parameters/params'
#require '../../lib/mts/SMSC/KeyboardHandler'


class SayHelloController < ApplicationController



  def say

    @phone = params["phone_number"]
    @phone_number  = "375298766719"
    as= GetSubscriber(@phone)
    @phone_number=as


  end

  def sum

  end


  def calc

  end

  def sendsms(phone)



  end

end
