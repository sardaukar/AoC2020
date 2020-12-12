require "spec"
require "../day10_part1"

describe "Day10Part1" do
  it "correctly works with the test input" do
    day10 = Day10Part1.new("test")

    (day10.run!).should eq [7, 5]
  end

  it "correctly works with the test input" do
    day10 = Day10Part1.new("test2")

    (day10.run!).should eq [22, 10]
  end

  it "correctly works with the given input" do
    day10 = Day10Part1.new("input")

    (day10.run!).should eq [70, 32]

    puts "answer is #{70*32}"
  end
end
