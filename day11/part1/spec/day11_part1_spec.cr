require "spec"
require "../day11_part1"

describe "Day11Part1" do
  it "correctly works with the test input" do
    day11 = Day11Part1.new("test")

    (day11.run!).should eq 37
  end

  it "correctly works with the given input" do
    day11 = Day11Part1.new("input")

    (day11.run!).should eq 2_247
  end
end
