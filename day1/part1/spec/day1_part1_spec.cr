require "spec"
require "../day1_part1"

describe "Day1Part1" do
  it "correctly works with the test input" do
    day1 = Day1Part1.new("test")

    (day1.run!).should eq 514579
  end

  it "correctly works with the exercise input" do
    day1 = Day1Part1.new("input")

    (day1.run!).should eq 270144
  end
end
