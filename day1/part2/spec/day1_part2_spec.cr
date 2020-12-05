require "spec"
require "../day1_part2"

describe "Day1Part2" do
  it "correctly works with the test input" do
    day1 = Day1Part2.new("test")

    (day1.run!).should eq 241861950
  end

  it "correctly works with the exercise input" do
    day1 = Day1Part2.new("input")

    (day1.run!).should eq 261342720
  end
end
