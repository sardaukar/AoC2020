class ShipOrWaypoint
  @east_west : Int32
  @north_south : Int32

  property :east_west, :north_south

  def initialize(@east_west, @north_south); end

  def move_to_waypoint(waypoint, times)
    @east_west = @east_west + waypoint.east_west * times
    @north_south = @north_south + waypoint.north_south * times
  end

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
    end
  end

  def rotate(direction, value)
    rotations = (value / 90).to_i

    case direction
    when :clockwise
      rotations.times do
        @east_west, @north_south = @north_south, -@east_west
      end
    when :anticlockwise
      rotations.times do
        @east_west, @north_south = -@north_south, @east_west
      end
    else
      raise ArgumentError.new("this never happens")
    end
  end
end

class Day12Part2
  @lines : Array(String)

  def initialize(filename)
    @lines = File.read_lines(filename)
  end

  def run!
    ship = ShipOrWaypoint.new(0, 0)
    waypoint = ShipOrWaypoint.new(10, 1)

    @lines.each do |instruction|
      ship, waypoint = process_instruction(instruction, ship, waypoint)
    end

    ship.east_west.abs + ship.north_south.abs
  end

  private def process_instruction(instruction, ship, waypoint)
    value = instruction[1..-1].to_i

    case instruction[0]
    when 'N'
      waypoint.move(:north, value)
    when 'S'
      waypoint.move(:south, value)
    when 'E'
      waypoint.move(:east, value)
    when 'W'
      waypoint.move(:west, value)
    when 'L'
      waypoint.rotate(:anticlockwise, value)
    when 'R'
      waypoint.rotate(:clockwise, value)
    when 'F'
      ship.move_to_waypoint(waypoint, value)
    else
      raise ArgumentError.new("this never happens #{instruction[0]}")
    end

    [ship, waypoint]
  end
end
