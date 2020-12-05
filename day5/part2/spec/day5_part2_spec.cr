require "spec"
require "../day5_part2"

describe "Day5Part2" do
  it "correctly works with the test input" do
    day5 = Day5Part2.new("input")

    (day5.run!).should eq 629
  end
end
