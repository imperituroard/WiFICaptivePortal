#!/usr/bin/env ruby
# encoding: UTF-8


# Sample SMS gateway that can receive MOs (mobile originated messages) and
# DRs (delivery reports), and send MTs (mobile terminated messages).
# MTs are, in the name of simplicity, entered on the command line in the format
# <sender> <receiver> <message body>
# MOs and DRs will be dumped to standard out.

#require 'rubygems'
#require 'smpp'
#require '../../lib/mts/SMSC/sms_samplegateway'
#require '../../config/Parameters/params'
#require '../../lib/mts/SMSC/KeyboardHandler'

#LOGFILE = File.dirname(__FILE__) + "/sms_gateway.log"
#Smpp::Base.logger = Logger.new(LOGFILE)

# We use EventMachine to receive keyboard input (which we send as MT messages).
# A "real" gateway would probably get its MTs from a message queue instead.


#include SampleGateway

# Start the Gateway
#begin
#  puts "Starting SMS Gateway. Please check the log at #{LOGFILE}"

  # SMPP properties. These parameters work well with the Logica SMPP simulator.
  # Consult the SMPP spec or your mobile operator for the correct settings of
  # the other properties.
#param_smsc = Parameters.new
#  config = param_smsc.smsc
#  gw = SampleGateway.new
#  gw.start(config)

    #gw.send_mt(id, 'MTS.WiFI', '375298766719', 'body')
#rescue Exception => ex
 # puts "Exception in SMS Gateway: #{ex} at #{ex.backtrace.join("\n")}"
#end