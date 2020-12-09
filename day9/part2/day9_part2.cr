class Day9Part2
  @filename : String
  @preamble_size : Int32

  def initialize(@filename, @preamble_size); end

  def run!
    numbers = File.read_lines(@filename).map &.to_i64

    invalid_number = get_invalid_number(numbers)

    (0...numbers.size).each do |start_idx|
      success, lower, upper = try_sequence(numbers, start_idx, invalid_number)
      if success
        range = numbers[lower.as(Int32)..upper.as(Int32)]
        return range.min.to_i64 + range.max.to_i64
      end
    end
  end

  private def try_sequence(numbers, start_idx, invalid_number)
    accu = 0.to_i64
    numbers.each_with_index do |number, idx|
      next if idx < start_idx

      accu += number

      if accu == invalid_number
        return [true, start_idx, idx]
      end

      break if accu.not_nil! > invalid_number.not_nil!
    end

    [false, 0, 0]
  end

  private def get_invalid_number(numbers)
    numbers.each_with_index do |number, idx|
      next if idx < @preamble_size

      return number unless valid?(number, numbers[idx - @preamble_size..idx - 1])
    end
  end

  private def valid?(number, previous_numbers)
    previous_numbers.combinations(2).any? { |c| c[0] + c[1] == number }
  end
end
