require "spec"
require "../day7_part1"

describe "Day7Part1" do
  it "correctly works with the test input" do
    day7 = Day7Part1.new("test")

    (day7.run!).should eq 4
  end

  it "correctly works with the given input" do
    day7 = Day7Part1.new("input")

    (day7.run!).should eq 335
  end
end
