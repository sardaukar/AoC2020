class Day1Part2
  @filename : String

  def initialize(@filename); end

  def run!
    lines = File.read_lines(@filename).map &.to_i

    lines.each do |number|
      (lines - [number]).each do |other_number|
        (lines - [number] - [other_number]).each do |other_other_number|
          if number + other_number + other_other_number == 2020
            return number * other_number * other_other_number
          end
        end
      end
    end
  end
end
