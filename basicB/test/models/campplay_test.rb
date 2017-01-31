require "test_helper"

describe Campplay do
  let(:campplay) { Campplay.new }

  it "must be valid" do
    value(campplay).must_be :valid?
  end
end
