require 'osc'

module Launchboard
  class OSCReceiver
    include Launchboard::Receiver

    def initialize(address,
                   port,
                   listen_address='localhost',
                   listen_port='9898')
      @client = OSC::Client.new(port, address)
      @listener = OSC::Server.new(listen_port, listen_address)
    end

    def name
      "#{address}:#{port}"
    end

    def do(action)
    end
  end
end
