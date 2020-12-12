class Day10Part2
  @filename : String
  @chains : Array(Array(Int64))

  def initialize(@filename)
    @chains = Array(Array(Int64)).new
  end

  def run!
    lines = [[0.to_i64, 1.to_i64]] + File.read_lines(@filename).map { |x| [x.to_i64, 0.to_i64] }
    lines.sort!

    lines.each_with_index do |line, idx|
      current_number, current_paths = line

      lines.each_with_index do |(number, paths), inner_idx|
        next unless inner_idx > idx
        break if number > current_number + 3

        lines[inner_idx] = [number, paths + current_paths]
      end
    end

    lines.last.last
  end
end
