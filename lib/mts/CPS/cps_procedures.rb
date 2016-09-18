#cps
require 'openssl'
require 'savon'
require 'rubygems'
require 'nokogiri'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class CPS_procedures
  #require 'openssl'
  #require 'https'
  #http = Net::HTTP.new('example.com', 443)
  #http.use_ssl = true
  #http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  def GetSubscriber(msisdn)
    # self.verify_mode   = OpenSSL::SSL::VERIFY_NONE
    #Savon.client(ssl_verify_mode: :none)
    client = Savon.client do
      ssl_verify_mode :none
      wsdl "https://172.24.242.4:8443/ua/wsdl/UnifiedApi.wsdl"
      #wsdl "C:/Ruby22-x64/UnifiedApi.wsdl.txt"
      endpoint "http://172.24.242.4:8080/ua/soap"
      namespace "http://broadhop.com/unifiedapi/soap/types"
    end

    response = client.call(:get_subscriber) do
      message(networkId: msisdn)
    end
    #puts "all done"
    #response = client.call(:authenticate, message: message)

    #http://savonrb.com/version2/response.html

    answer = response.to_xml
    puts answer

    #response = client.call(:get_subscriber, message: {first_name: "foo" ,last_name: "foo"})
    #hasher = client.to_hash
    #response = client.to_param
    #response.to_hash[:get_bank_response][:details][:plz]

    #response = Savon::Response#to_hash
    #hres = response.to_hash
    #all_data = hres[:response][:asses_data][:date][:amount][:assesReference][:year][:cusOffCode][:serie][:number][:date][:time]
    #puts response
    #if response.success?
    # else
    #end
  end
end