require "spec"
require "../day11_part2"

describe "Day11Part2" do
  it "correctly works with the test input" do
    day11 = Day11Part2.new("test")

    (day11.run!).should eq 26
  end

  it "correctly works with the given input" do
    day11 = Day11Part2.new("input")

    (day11.run!).should eq 2_011
  end
end
