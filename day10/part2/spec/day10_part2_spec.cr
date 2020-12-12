require "spec"
require "../day10_part2"

describe "Day10Part2" do
  it "correctly works with the test input" do
    day10 = Day10Part2.new("test")

    (day10.run!).should eq 8
  end

  it "correctly works with the test input" do
    day10 = Day10Part2.new("test2")

    (day10.run!).should eq 19_208
  end

  it "correctly works with the test input" do
    day10 = Day10Part2.new("test3")

    (day10.run!).should eq 3
  end

  it "correctly works with the given input" do
    day10 = Day10Part2.new("input")

    (day10.run!).should eq 99_214_346_656_768
  end
end
