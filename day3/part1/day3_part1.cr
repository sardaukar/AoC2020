class Day3Part1
  @filename : String

  def initialize(@filename); end

  def run!
    lines = File.read_lines(@filename)

    current_x = 0
    current_y = 0

    height = lines.size
    width = lines[0].size

    trees_found = 0

    loop do
      current_x = (current_x + 3) % width
      current_y += 1

      break if current_y >= height

      current_position_on_map = lines[current_y][current_x]

      trees_found += 1 if current_position_on_map == '#'
    end

    trees_found
  end
end
