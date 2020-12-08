require "spec"
require "../day8_part1"

describe "Day8Part1" do
  it "correctly works with the test input" do
    day8 = Day8Part1.new("test")

    (day8.run!).should eq 5
  end

  it "correctly works with the given input" do
    day8 = Day8Part1.new("input")

    (day8.run!).should eq 1675
  end
end
