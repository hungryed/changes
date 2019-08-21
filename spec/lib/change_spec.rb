require "change"

RSpec.describe Change do
  describe ".change_for" do
    it "returns the correct number of each coin to supply customer" do
      expect(described_class.change_for(49)).to eq({
        25 => 1,
        10 => 2,
        1 => 4
      })
    end
  end
end
