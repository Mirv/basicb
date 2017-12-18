require "test_helper"
require "generators/initializer/initializer_generator"

describe InitializerGenerator do
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # it "generator runs without errors" do
  #   # No error raised? It passes.
  #   run_generator ["arguments"]
  # end
end
