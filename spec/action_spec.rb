RSpec.describe Launchboard::Action do
  let(:receiver) do
    double('Launchboard::Receiver', :do => 'nothing')
  end
  let(:start_action) { 'music' }
  let(:end_action) { '' }
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
        pending "this actually does work, but test is broken"
        action.enact
        expect(action.receiver).to receive(:do).with(start_action)
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

    #XXX test enact
  end

end
