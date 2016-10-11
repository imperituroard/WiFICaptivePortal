#cps
#http://savonrb.com/version2/response.html

require 'openssl'
require 'savon'
require 'rubygems'
require 'nokogiri'
require 'rails'
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

  def ExecuteActionRequest_StartSession(msisdn)
    client = Savon.client do
      ssl_verify_mode :none
      wsdl "https://172.24.242.4:8443/ua/wsdl/UnifiedApi.wsdl"
      endpoint "http://172.24.242.4:8080/ua/soap"
      namespace "http://broadhop.com/unifiedapi/soap/types"
    end
    message = {
        :audit => {:id => "username", :comment => "comment"},
        :code => "start-session",
        :arg => [
            {:code =>"ISG_IP", :value => "10.10.10.10"},
            {:code =>"PORT_NUMBER", :value => "PBHK"},
            {:code =>"type", :value => "isg|asr9k|null"},
            {:code => "USER_NAME", :value => "123456789"},
            {:code => "PASSWORD", :value => "password"}
        ]
    }
    response = client.call(:execute_action) do
      message(message)
    end
    puts answer = response.to_xml
    return answer
  end

  def ExecuteActionRequest_LocationQuery(msisdn)
    client = Savon.client do
      ssl_verify_mode :none
      wsdl "https://172.24.242.4:8443/ua/wsdl/UnifiedApi.wsdl"
      endpoint "http://172.24.242.4:8080/ua/soap"
      namespace "http://broadhop.com/unifiedapi/soap/types"
    end
    message = {
        :audit => {:id => "username", :comment => "comment"},
        :code => "location-query",
        :arg => [
            {:code =>"FramedIP", :value => "10.10.10.10"},
            {:code =>"PORT_NUMBER", :value => "PBHK"},
            {:code =>"type", :value => "isg|asr9k|null"}
        ]
    }
    response = client.call(:execute_action) do
      message(message)
    end
    puts answer = response.to_xml
    return answer
  end

  def QuerySession_framedIP(framedIP)
    client = Savon.client do
      ssl_verify_mode :none
      wsdl "https://172.24.242.4:8443/ua/wsdl/UnifiedApi.wsdl"
      endpoint "http://172.24.242.4:8080/ua/soap"
      namespace "http://broadhop.com/unifiedapi/soap/types"
    end
    message = {
        :audit => {:id => "username", :comment => "comment"},
        :key => {
            :code =>"ISG_IP",
            :primary =>"false",
            :keyField =>{:code => "framedIp", :value => framedIP}
        }
    }
    response = client.call(:query_session) do
      message(message)
    end
    puts answer = response.to_xml
    return answer
  end



end