require "spec"
require "../day6_part2"

describe "Day6Part2" do
  it "correctly works with the test input" do
    day6 = Day6Part2.new("test")

    (day6.run!).should eq 6
  end

  it "correctly works with the test input" do
    day6 = Day6Part2.new("input")

    (day6.run!).should eq 3229
  end
end
