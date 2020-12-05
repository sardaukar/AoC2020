require "spec"
require "../day4_part1"

describe "Day4Part1" do
  it "correctly works with the test input" do
    day4 = Day4Part1.new("test")

    (day4.run!).should eq 2
  end

  it "correctly works with the exercise input" do
    day4 = Day4Part1.new("input")

    (day4.run!).should eq 256
  end
end
