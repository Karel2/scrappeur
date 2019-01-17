require_relative '../lib/trader'

describe "the perform method" do
    it "should return hash, and hash is not nil" do
      expect(perform).not_to be_nil
    end
  end