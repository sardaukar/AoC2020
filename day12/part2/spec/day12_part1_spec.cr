require "spec"
require "../day12_part2"

describe "Day12Part2" do
  it "correctly works with the test input" do
    day12 = Day12Part2.new("test")

    (day12.run!).should eq 286
  end

  it "correctly works with the given input" do
    day12 = Day12Part2.new("input")

    (day12.run!).should eq 51_249
  end
end
