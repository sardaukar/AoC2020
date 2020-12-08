require "spec"
require "../day7_part2"

describe "Day7Part2" do
  it "correctly works with the test input" do
    day7 = Day7Part2.new("test")

    (day7.run!).should eq 126
  end

  it "correctly works with the given input" do
    day7 = Day7Part2.new("input")

    (day7.run!).should eq 2431
  end
end
