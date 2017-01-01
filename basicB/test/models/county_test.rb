require "test_helper"

describe County do
  let(:county) { County.new }

  it "must be valid" do
    value(county).must_be :valid?
  end
end
