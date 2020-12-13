require "spec"
require "../day13_part2"

describe "Day13Part2" do
  it "correctly works with the test input" do
    day13 = Day13Part2.new("test")

    (day13.run!).should eq 1_068_781
  end

  it "correctly works with the test input" do
    day13 = Day13Part2.new("test2")

    (day13.run!).should eq 3417
  end

  it "correctly works with the test input" do
    day13 = Day13Part2.new("test3")

    (day13.run!).should eq 754_018
  end

  it "correctly works with the test input" do
    day13 = Day13Part2.new("test4")

    (day13.run!).should eq 779_210
  end

  it "correctly works with the test input" do
    day13 = Day13Part2.new("test5")

    (day13.run!).should eq 1_261_476
  end

  it "correctly works with the test input" do
    day13 = Day13Part2.new("test6")

    (day13.run!).should eq 1_202_161_486
  end

  it "correctly works with the given input" do
    day13 = Day13Part2.new("input")

    (day13.run!).should eq 690_123_192_779_524
  end
end
