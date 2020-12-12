require "spec"
require "../day12_part1"

describe "Day12Part1" do
  it "correctly works with the test input" do
    day12 = Day12Part1.new("test")

    (day12.run!).should eq 25
  end

  it "correctly works with the given input" do
    day12 = Day12Part1.new("input")

    (day12.run!).should eq 757
  end
end
