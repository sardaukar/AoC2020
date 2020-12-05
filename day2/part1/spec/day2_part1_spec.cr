require "spec"
require "../day2_part1"

describe "Day2Part1" do
  it "correctly works with the test input" do
    day2 = Day2Part1.new("test")

    (day2.run!).should eq 2
  end

  it "correctly works with the exercise input" do
    day2 = Day2Part1.new("input")

    (day2.run!).should eq 638
  end
end
