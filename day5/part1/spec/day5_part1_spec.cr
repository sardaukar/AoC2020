require "spec"
require "../day5_part1"

describe "Day5Part1" do
  it "correctly works with the test input" do
    day5 = Day5Part1.new(:string, "FBFBBFFRLR")

    (day5.run!).should eq [44, 5, 357]
  end

  it "correctly works with the test input" do
    day5 = Day5Part1.new(:string, "BFFFBBFRRR")

    (day5.run!).should eq [70, 7, 567]
  end

  it "correctly works with the test input" do
    day5 = Day5Part1.new(:string, "FFFBBBFRRR")

    (day5.run!).should eq [14, 7, 119]
  end

  it "correctly works with the test input" do
    day5 = Day5Part1.new(:string, "BBFFBBFRLL")

    (day5.run!).should eq [102, 4, 820]
  end

  it "correctly works with the exercise input" do
    day5 = Day5Part1.new(:file, "input")

    (day5.run!).should eq 911
  end
end
