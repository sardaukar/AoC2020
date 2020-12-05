require "spec"
require "../day3_part1"

describe "Day3Part1" do
  it "correctly works with the test input" do
    day3 = Day3Part1.new("test")

    (day3.run!).should eq 7
  end

  it "correctly works with the exercise input" do
    day3 = Day3Part1.new("input")

    (day3.run!).should eq 232
  end
end
