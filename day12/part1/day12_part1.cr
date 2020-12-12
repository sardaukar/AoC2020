class Positions
  @east_west : Int32
  @north_south : Int32
  @facing : Symbol

  property :east_west, :north_south, :facing

  DIRECTIONS = [:east, :north, :west, :south]

  def initialize(@east_west, @north_south, @facing); end

  def move(direction, value)
    case direction
    when :north
      @north_south += value
    when :south
      @north_south -= value
    when :east
      @east_west += value
    when :west
      @east_west -= value
    when :forward
      move(@facing, value)
    end
  end

  def rotate(direction, value)
    increments = (value / 90).to_i

    curr_index = DIRECTIONS.index(facing).not_nil!

    @facing =
      case direction
      when :left
        DIRECTIONS[(curr_index + increments) % 4].as(Symbol)
      when :right
        DIRECTIONS[(curr_index - increments) % 4].as(Symbol)
      else
        raise ArgumentError.new("this never happens")
      end
  end
end

class Day12Part1
  @lines : Array(String)

  def initialize(filename)
    @lines = File.read_lines(filename)
  end

  def run!
    positions = Positions.new(0, 0, :east)

    @lines.each do |instruction|
      positions = process_instruction(instruction, positions)

      # print "#{instruction} "
      # puts positions.inspect
    end

    positions.east_west.abs + positions.north_south.abs
  end

  private def process_instruction(instruction, positions)
    value = instruction[1..-1].to_i

    case instruction[0]
    when 'N'
      positions.move(:north, value)
    when 'S'
      positions.move(:south, value)
    when 'E'
      positions.move(:east, value)
    when 'W'
      positions.move(:west, value)
    when 'L'
      positions.rotate(:left, value)
    when 'R'
      positions.rotate(:right, value)
    when 'F'
      positions.move(:forward, value)
    else
      raise ArgumentError.new("this never happens #{instruction[0]}")
    end

    positions
  end
end
