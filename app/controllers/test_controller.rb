#require 'smpp'
#require 'eventmachine'
#require 'mts/smsc_gateway'


class TestController < ApplicationController


  def test

  #  require_relative '../../lib/mts/sample_smsc'

    #text = 'Привет'
   # message = text.encode("UTF-16BE").force_encoding("BINARY")
   # SampleGateway.send_mt('MTS.WiFI', '375298766719', message, data_coding: 8)
   # gw = SampleGateway.new
   # gw.start(config)
# connect to SMSC
  #  tx = EventMachine::run do
  #    $tx = EventMachine::connect(
  #        '172.24.224.6',
   #       '900',
   #       Smpp::Transceiver,
   #       config,             # a property hash
   #       delegate)            # delegate class that will receive callbacks on MOs and DRs and other events
  #  end
#
# send a message
   # tx.send_mt(id, from, '375298766719', body)

  end
end
