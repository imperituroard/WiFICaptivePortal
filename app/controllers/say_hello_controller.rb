class SayHelloController < ApplicationController
  def say
    a=params[:phone_field]
    puts a

  end

  def sum

  end

  def sendsms(number=375298766719, b)
  number+b
  end

end
