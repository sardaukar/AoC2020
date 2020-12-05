class Day5Part1
  @mode : Symbol
  @string_or_filename : String

  def initialize(@mode, @string_or_filename); end

  def run!
    if @mode == :string
      process_string(@string_or_filename)
    else
      process_file(@string_or_filename)
    end
  end

  private def process_string(string)
    range = {0, 127}
    chars = string.chars

    while chars.size > 4
      this_char = chars.shift

      lower_bound, upper_bound = range

      if this_char == 'F'
        upper_bound -= (((upper_bound - lower_bound) + 1) / 2).floor.to_i
        # puts "F - range is now {#{lower_bound},#{upper_bound}}"
      elsif this_char == 'B'
        lower_bound += (((upper_bound - lower_bound) + 1)/2).floor.to_i
        # puts "B - range is now {#{lower_bound},#{upper_bound}}"
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

    # puts "final row_nr is #{row_nr}"

    range = {0, 7}
    while chars.size > 1
      this_char = chars.shift

      lower_bound, upper_bound = range

      if this_char == 'L'
        upper_bound -= (((upper_bound - lower_bound) + 1) / 2).floor.to_i
        # puts "L - range is now {#{lower_bound},#{upper_bound}}"
      elsif this_char == 'R'
        lower_bound += (((upper_bound - lower_bound) + 1)/2).floor.to_i
        # puts "R - range is now {#{lower_bound},#{upper_bound}}"
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

    # puts "final col_nr is #{col_nr}"

    [row_nr, col_nr, row_nr * 8 + col_nr]
  end

  private def process_file(filename)
    max_nr = 0

    File.read_lines(filename).each do |line|
      this_nr = process_string(line)[2]

      max_nr = this_nr if this_nr > max_nr
    end

    max_nr
  end
end
