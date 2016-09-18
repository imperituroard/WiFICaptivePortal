class SayHelloController < ApplicationController
  def say
    a=params[:phone_field]

  end

  def sum

  end

  def sendsms(number=375298766719, b)
  number+b
  end

end
