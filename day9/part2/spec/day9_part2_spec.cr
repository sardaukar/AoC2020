require "spec"
require "../day9_part2"

describe "Day9Part2" do
  it "correctly works with the test input" do
    day9 = Day9Part2.new("test", 5)

    (day9.run!).should eq 62
  end

  it "correctly works with the given input" do
    day9 = Day9Part2.new("input", 25)

    (day9.run!).should eq 4_389_369
  end
end
