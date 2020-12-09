class Day9Part1
  @filename : String
  @preamble_size : Int32

  def initialize(@filename, @preamble_size); end

  def run!
    numbers = File.read_lines(@filename).map &.to_i64

    numbers.each_with_index do |number, idx|
      next if idx < @preamble_size

      return number unless valid?(number, numbers[idx - @preamble_size..idx - 1])
    end

    nil
  end

  private def valid?(number, previous_numbers)
    previous_numbers.combinations(2).any? { |c| c[0] + c[1] == number }
  end
end
