require '../../../lib/mts/SMSC/sms_samplegateway'
require 'smpp'
require '../../../config/Parameters/params'
require '../../../lib/mts/SMSC/KeyboardHandler'

#param_smsc = Parameters.new
#config = param_smsc.smsc



#thr = Thread.new do
begin
  #puts "Starting SMS Gateway. Please check the log at #{LOGFILE}"

  # SMPP properties. These parameters work well with the Logica SMPP simulator.
  # Consult the SMPP spec or your mobile operator for the correct settings of
  # the other properties.
  param_smsc = Parameters.new
  config = param_smsc.smsc

  gw = SampleGateway.new
  gw.start(config)

    #gw.send_mt(id, 'MTS.WiFI', '375298766719', 'body')
rescue Exception => ex
  puts "Exception in SMS Gateway: #{ex} at #{ex.backtrace.join("\n")}"
end

  #gw = SampleGateway.new
  #gw.start(config)
  #@gw.send_mt('MTS.WiFI', 375298766719, 'message')
#end

#sleep 15
#SampleGateway.send_mt('MTS.WiFI', 375298766719, 'message')
#gateway = SampleGateway.new

#message = text.encode("UTF-16BE").force_encoding("BINARY")
#tx.send_mt('MTS.WiFI', 375298766719, 'message', data_coding: 8)