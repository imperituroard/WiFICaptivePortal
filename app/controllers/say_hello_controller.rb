class SayHelloController < ApplicationController
  def say
  end

  def sum
   # require_relative '../../lib/mts/smsc_gatewaytest'
  end

  def sendsms(number=375298766719, b)
  number+b
  end

end
