class Day5Part2
  @filename : String

  def initialize(@filename); end

  def run!
    process_file(@filename)
  end

  private def process_string(string)
    range = {0, 127}
    chars = string.chars

    while chars.size > 4
      this_char = chars.shift

      lower_bound, upper_bound = range

      if this_char == 'F'
        upper_bound -= (((upper_bound - lower_bound) + 1) / 2).floor.to_i
      elsif this_char == 'B'
        lower_bound += (((upper_bound - lower_bound) + 1)/2).floor.to_i
      else
        raise ArgumentError.new("unexpected char #{this_char}")
      end

      range = {lower_bound, upper_bound}
    end

    final_f_or_b = chars.shift

    row_nr =
      if final_f_or_b == 'F'
        range[0]
      elsif final_f_or_b == 'B'
        range[1]
      else
        raise ArgumentError.new("unexpected char #{this_char}")
      end

    range = {0, 7}
    while chars.size > 1
      this_char = chars.shift

      lower_bound, upper_bound = range

      if this_char == 'L'
        upper_bound -= (((upper_bound - lower_bound) + 1) / 2).floor.to_i
      elsif this_char == 'R'
        lower_bound += (((upper_bound - lower_bound) + 1)/2).floor.to_i
      else
        raise ArgumentError.new("unexpected char #{this_char}")
      end

      range = {lower_bound, upper_bound}
    end

    final_l_or_r = chars.shift

    col_nr =
      if final_l_or_r == 'L'
        range[0]
      elsif final_l_or_r == 'R'
        range[1]
      else
        raise ArgumentError.new("unexpected char #{this_char}")
      end

    row_nr * 8 + col_nr
  end

  private def process_file(filename)
    numbers = [] of Int32

    File.read_lines(filename).each do |line|
      numbers << process_string(line)
    end

    numbers.sort.each_with_index do |nr, idx|
      next if idx == 0

      unless numbers.includes?(nr.succ) && numbers.includes?(nr.pred)
        return nr.succ
      end
    end
  end
end
