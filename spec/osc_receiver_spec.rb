require_relative 'spec_helper'

RSpec.describe Launchboard::OSCReceiver do
  let(:osc_client) { double('OSC::Client', :send => 'something') }
  let(:receiver) do
    Launchboard::OSCReceiver.new
  end

  context "#name" do
    it "has a default" do
      expect(receiver).to receive(:name).and_return('Open Sound Control (OSC)')
      receiver.name
    end

    it "can be set" do
      expect(receiver).to receive(:name).and_return('something')
      receiver.name = 'something'
      receiver.name
    end
  end

  context "#make_client" do
    it "creates OSC::Client @client" do
      expect(OSC::Client).to receive(:new).and_return osc_client
      receiver.make_client(1234)
    end
  end

  context "#do" do
    it "calls @client#send with action" do
      allow(OSC::Client).to receive(:new).and_return osc_client
      expect(osc_client).to receive(:send).with 'action'
      receiver.make_client(1234)
      receiver.do('action')
    end
  end
end
