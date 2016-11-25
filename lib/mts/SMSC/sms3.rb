require 'eventmachine'
require '../../../config/Parameters/params'
require 'smpp'

class MessageSender



  def self.next


        @@tx.send_mt(1, 'MTS.WiFI', 375298766719, 'dbvgdb')

      EM.next_tick(&method(:next))
    EventMachine::stop
        #EventMachine::stop_event_loop
        #@@tx.unbound

  end



param_smsc = Parameters.new
config = param_smsc.smsc
pdr_storage = {}
loop do
  EventMachine::run do
    @@tx = EventMachine::connect(
        config[:host],
        config[:port],
        Smpp::Transceiver,
        config,
        self    # delegate that will receive callbacks on MOs and DRs and other events
    )

    EM.add_timer(5){ self.next }     # gets the messages from redis list and sends at each click of the EventMachine

  end
  puts "Disconnected. Reconnecting in 5 seconds.."
  sleep 5
end
end