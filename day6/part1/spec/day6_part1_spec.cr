require "spec"
require "../day6_part1"

describe "Day6Part1" do
  it "correctly works with the test input" do
    day6 = Day6Part1.new("test")

    (day6.run!).should eq 11
  end

  it "correctly works with the given input" do
    day6 = Day6Part1.new("input")

    (day6.run!).should eq 6437
  end
end
