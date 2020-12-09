require "spec"
require "../day9_part1"

describe "Day9Part1" do
  it "correctly works with the test input" do
    day9 = Day9Part1.new("test", 5)

    (day9.run!).should eq 127
  end

  it "correctly works with the given input" do
    day9 = Day9Part1.new("input", 25)

    (day9.run!).should eq 29_221_323
  end
end
