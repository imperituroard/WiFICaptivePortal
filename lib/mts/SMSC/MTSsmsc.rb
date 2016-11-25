require 'rubygems'
require 'eventmachine'
require 'smpp'
require './config/Parameters/params'
#require '../../../config/Parameters/params'

LOGFILE = File.dirname(__FILE__) + "/sms_gateway.log"
Smpp::Base.logger = Logger.new(LOGFILE)

class MTSsmsc

  #def unbound(transceiver)
  #  #logger.info "Delegate: transceiver unbound"
  #  EventMachine::stop_event_loop
  #end

  def self.sd

  end

  def self.next
    @@tx.send_mt(@@id, @@sender, @@receiver, @@message)
    #EM.next_tick(&method(:next))

    EM.next_tick(&method(:sd))
    EM::stop_event_loop
    #EM.next_tick

    EM::stop


  end



  def startSMSC(id_in,sender_in,receiver_in,text_in)

    @@id=id_in
    @@sender=sender_in
    @@receiver=receiver_in
    @@message=text_in
    param_smsc = Parameters.new
    config = param_smsc.smsc
    pdr_storage = {}
    @cou=1
    #loop do
      EventMachine::run do
        @@tx = EventMachine::connect(
            config[:host],
            config[:port],
            Smpp::Transceiver,
            config,
            self    # delegate that will receive callbacks on MOs and DRs and other events
        )
        if @cou =1
        EM.add_timer(1){ MTSsmsc.next }     # gets the messages from redis list and sends at each click of the EventMachine
@cou = @cou+1
        end
      end
      puts "Disconnected. Reconnecting in 5 seconds.."
      sleep 1
    #end

  end
end