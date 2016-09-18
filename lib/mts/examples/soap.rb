require 'rubygems'
require 'savon'

client = Savon::Client.new "http://1.2.3.4/xyz/abcd/fsds.wsdl"

res = client.query_unpaid_assesments do |soap,wsse|
  soap.namespaces["xmlns:SOAP-ENV"] = "http://schemas.xmlsoap.org/soap/envelope/"
  soap.namespaces["xmlns:xsi"] = "http://www.w3.org/2001/XMLSchema-instance"
  soap.namespaces["xmlns:xsd"] = "http://www.w3.org/2001/XMLSchema"

  wsse.username="xyz"
  wsse.password="123"

  soap.body = {:orderNumber => 111222333 }
end

response = Savon::Response#to_hash
hres = response.to_hash
all_data = hres[:response][:asses_data][:date][:amount][:assesReference][:year][:cusOffCode][:serie][:number][:date][:time]