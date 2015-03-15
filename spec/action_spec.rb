require_relative 'spec_helper'

RSpec.describe Launchboard::Action do
  let(:receiver) do
    double('Launchboard::Receiver', :do => 'nothing')
  end
  let(:start_action) { 'music' }
  let(:end_action) { nil }
  let(:action) do
    Launchboard::Action.new(receiver, start_action, end_action)
  end

  context "without end_action" do
    describe "#loops?" do
      it "returns false" do
        expect(action.loops?).to eq false
      end
    end

    describe "#enact" do
      it "does start_action" do
        expect(action.receiver).to receive(:do).with(start_action)
        action.enact
      end
    end
  end

  context "with end_action" do
    let(:end_action) { 'something' }

    describe "#loops?" do
      it "returns true" do
        expect(action.loops?).to eq true
      end
    end

    describe "#enable" do
      it "toggles start_action and end_action" do
        expect(action.receiver).to receive(:do).with(start_action)
        action.enact

        expect(action.receiver).to receive(:do).with(end_action)
        action.enact
      end
    end
  end

end
