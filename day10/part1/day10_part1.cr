class Day10Part1
  @filename : String

  def initialize(@filename); end

  def run!
    lines = File.read_lines(@filename).map &.to_i64
    lines.sort!

    diffs = {
      1 => 0,
      3 => 0,
    }

    current_joltage = 0

    loop do
      next_number = lines.shift

      diffs[(next_number - current_joltage).to_i] += 1

      current_joltage = next_number

      break if lines.empty?
    end

    diffs[3] += 1

    [diffs[1], diffs[3]]
  end
end
