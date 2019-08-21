require "change"

RSpec.describe Change::Calculator do
  let(:cents) { 49 }
  subject { described_class.new(cents) }

  describe "#mapped_change" do
    it "returns the amount of each change needed to fulfill the cents provided" do
      expect(subject.mapped_change).to eq({
        25 => 1,
        10 => 2,
        1 => 4
      })
    end
  end
end
