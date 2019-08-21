require "change"

RSpec.describe Change::Cli do
  let(:args) { ["49"] }
  subject { described_class.new(*args) }
  original_stderr = $stderr
  original_stdout = $stdout

  before :each do
    $stderr = File.open(File::NULL, "w")
    $stdout = File.open(File::NULL, "w")
  end

  after :each do
    $stderr = original_stderr
    $stdout = original_stdout
  end


  describe ".change_for" do
    it "display the correct number of each coin to supply customer" do
      expect(described_class.change_for(args)).to eq({
        25 => 1,
        10 => 2,
        1 => 4,
      })
    end

    context "no args" do
      let(:args) { [] }

      it "raises an descriptive error" do
        expect { described_class.change_for(args) }.to raise_error(
          Change::Errors::NoCentsProvided, "You must provide an amount of cents"
        )
      end
    end
  end

  describe "#display_change" do
    let(:args) { ["77"] }
    let(:expected) {
      {
        25 => 3,
        1 => 2
      }
    }

    it "outputs a mapping of amount of each coin to meet change requirement" do
      expect(subject.display_change).to eq(expected)
    end

    it "displays in the terminal" do
      expect(subject).to receive(:p).with(expected)
      subject.display_change
    end
  end
end
