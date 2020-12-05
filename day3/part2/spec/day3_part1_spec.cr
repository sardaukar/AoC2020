require "spec"
require "../day3_part2"

describe "Day3Part2" do
  it "correctly works with the test input r1, d1" do
    day3 = Day3Part2.new("test", 1, 1)

    (day3.run!).should eq 2
  end

  it "correctly works with the test input r3, d1" do
    day3 = Day3Part2.new("test", 3, 1)

    (day3.run!).should eq 7
  end

  it "correctly works with the test input r5, d1" do
    day3 = Day3Part2.new("test", 5, 1)

    (day3.run!).should eq 3
  end

  it "correctly works with the test input r7, d1" do
    day3 = Day3Part2.new("test", 7, 1)

    (day3.run!).should eq 4
  end

  it "correctly works with the test input r1, d2" do
    day3 = Day3Part2.new("test", 1, 2)

    (day3.run!).should eq 2
  end

  it "correctly works with the test input" do
    day3_1 = Day3Part2.new("test", 1, 1).run!
    day3_2 = Day3Part2.new("test", 3, 1).run!
    day3_3 = Day3Part2.new("test", 5, 1).run!
    day3_4 = Day3Part2.new("test", 7, 1).run!
    day3_5 = Day3Part2.new("test", 1, 2).run!

    (day3_1 * day3_2 * day3_3 * day3_4 * day3_5).should eq 336
  end

  it "correctly works with the exercise input" do
    day3_1 = Day3Part2.new("input", 1, 1).run!
    day3_2 = Day3Part2.new("input", 3, 1).run!
    day3_3 = Day3Part2.new("input", 5, 1).run!
    day3_4 = Day3Part2.new("input", 7, 1).run!
    day3_5 = Day3Part2.new("input", 1, 2).run!

    (day3_1 * day3_2 * day3_3 * day3_4 * day3_5).should eq 3_952_291_680
  end
end
