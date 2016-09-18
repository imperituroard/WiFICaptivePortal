module KeyboardHandler
  include EventMachine::Protocols::LineText2

  def receive_line(data)
    sender, receiver, *body_parts = data.split
    unless sender && receiver && body_parts.size > 0
      puts "Syntax: <sender> <receiver> <message body>"
    else
      body = body_parts.join(' ')
      puts "Sending MT from #{sender} to #{receiver}: #{body}"
      SampleGateway.send_mt(sender, receiver, body)
    end
    prompt
  end

  def prompt
    print "MT: "
    $stdout.flush
  end
end