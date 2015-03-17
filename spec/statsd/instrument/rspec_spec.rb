RSpec.describe Statsd::Instrument::Rspec do
  include described_class

  describe "increment_statsd" do
    context "when keys match" do
      let(:key_1) { :key_1 }

      context "when using the positive matcher" do
        it "passes" do
          expect { StatsD.increment(key_1) }.to increment_statsd(key_1)
        end
      end

      context "when negating the matcher" do
        it "fails" do
          expect { expect { StatsD.increment(key_1) }.not_to increment_statsd(key_1) }.to raise_error
        end
      end
    end

    context "when keys do not match" do
      let(:key_1) { :key_1 }
      let(:key_2) { :key_2 }

      context "when using the positive matcher" do
        it "fails" do
          expect { expect { StatsD.increment(key_1) }.to increment_statsd(key_2) }.to raise_error
        end
      end

      context "when negating the matcher" do
        it "passes" do
          expect { StatsD.increment(key_1).not_to increment_statsd(key_2) }
        end
      end
    end
  end
end
