require "spec"
require "../day13_part1"

describe "Day13Part1" do
  it "correctly works with the test input" do
    day13 = Day13Part1.new("test")

    (day13.run!).should eq 295
  end

  it "correctly works with the given input" do
    day13 = Day13Part1.new("input")

    (day13.run!).should eq 333
  end
end
