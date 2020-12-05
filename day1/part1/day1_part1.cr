class Day1Part1
  @filename : String

  def initialize(@filename); end

  def run!
    lines = File.read_lines(@filename).map &.to_i

    lines.each do |number|
      (lines - [number]).each do |other_number|
        if number + other_number == 2020
          return number * other_number
        end
      end
    end
  end
end
