require "spec"
require "../day2_part2"

describe "Day2Part2" do
  it "correctly works with the test input" do
    day1 = Day2Part2.new("test")

    (day1.run!).should eq 1
  end

  it "correctly works with the exercise input" do
    day1 = Day2Part2.new("input")

    (day1.run!).should eq 699
  end
end
