require "spec"
require "../day8_part2"

describe "Day8Part2" do
  it "correctly works with the test input" do
    day8 = Day8Part2.new("test")

    (day8.run!).should eq 8
  end

  it "correctly works with the given input" do
    day8 = Day8Part2.new("input")

    (day8.run!).should eq 1532
  end
end
