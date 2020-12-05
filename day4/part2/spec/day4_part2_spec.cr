require "spec"
require "../day4_part2"

describe "Day4Part2" do
  it "correctly works with the test input" do
    day4 = Day4Part2.new("test")

    (day4.run!).should eq 2
  end

  it "correctly works with the exercise input" do
    day4 = Day4Part2.new("input")

    (day4.run!).should eq 198
  end
end
