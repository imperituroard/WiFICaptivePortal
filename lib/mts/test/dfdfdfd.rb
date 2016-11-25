# connect to SMSC
tx = EventMachine::run do
  $tx = EventMachine::connect(
      config[:host],
      config[:port],
      Smpp::Transceiver,
      config, # a property hash
      mo_proc, # the proc invoked on incoming (MO) messages
      dr_proc, # the proc invoked on delivery reports
      pdr_storage) # hash-like storage for pending delivery reports
end


# Send an MT SMS message. Delegate will receive message_accepted callback when SMSC
# acknowledges, or the message_rejected callback upon error
def send_mt(message_id, source_addr, destination_addr, short_message, options={})
  logger.debug "Sending MT: #{short_message}"
  if @state == :bound
    pdu = Pdu::SubmitSm.new(source_addr, destination_addr, short_message, options)
    write_pdu pdu

    # keep the message ID so we can associate the SMSC message ID with our message
    # when the response arrives.
    @ack_ids[pdu.sequence_number] = message_id
  else
    raise InvalidStateException, "Transceiver is unbound. Cannot send MT messages."
  end
end