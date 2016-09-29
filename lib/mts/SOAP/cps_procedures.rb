#cps
#http://savonrb.com/version2/response.html

require 'openssl'
require 'savon'
require 'rubygems'
require 'nokogiri'
#OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class CPS_procedures

  def GetSubscriber(msisdn)
    client = Savon.client do
      ssl_verify_mode :none
      wsdl "https://172.24.242.4:8443/ua/wsdl/UnifiedApi.wsdl"
      endpoint "http://172.24.242.4:8080/ua/soap"
      namespace "http://broadhop.com/unifiedapi/soap/types"
    end
    response = client.call(:get_subscriber) do
      message(networkId: msisdn)
    end
    answer = response.to_xml
    return answer
  end

  def ExecuteActionRequest(msisdn)
    client = Savon.client do
      ssl_verify_mode :none
      wsdl "https://172.24.242.4:8443/ua/wsdl/UnifiedApi.wsdl"
      endpoint "http://172.24.242.4:8080/ua/soap"
      namespace "http://broadhop.com/unifiedapi/soap/types"
    end
    response = client.call(:execute_action) do
      message(networkId: msisdn)
    end
    answer = response.to_xml
    return answer
  end

end