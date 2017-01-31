require "test_helper"

describe Campcount do
  let(:campcount) { Campcount.new }

  it "must be valid" do
    value(campcount).must_be :valid?
  end
end
