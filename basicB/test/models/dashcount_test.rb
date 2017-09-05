require "test_helper"

describe Dashcount do
  let(:dashcount) { Dashcount.new }

  it "must be valid" do
    value(dashcount).must_be :valid?
  end
end
