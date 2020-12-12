class Day11Part2
  @lines : Array(String)
  @n_rows : Int32
  @n_cols : Int32

  def initialize(filename)
    @lines = File.read_lines(filename)
    @n_rows = @lines.size
    @n_cols = @lines.first.size
  end

  def run!
    # print_state(@lines)

    state = apply_rules(@lines)
    # print_state(state)

    loop do
      new_state = apply_rules(state)
      # print_state(new_state)

      break if new_state == state

      state = new_state
    end

    number_of_free_seats(state)
  end

  private def number_of_free_seats(state)
    total = 0

    state.each { |line| total += line.count("#") }

    total
  end

  private def print_state(state)
    state.each { |line| puts line }
    puts
  end

  private def apply_rules(state)
    new_state = Array(String).new

    state.each_with_index do |line, row|
      new_line = ""

      line.chars.each_with_index do |seat, col|
        new_line += new_state_for_cell(seat, row, col, state)
      end

      new_state << new_line
    end

    new_state
  end

  private def new_state_for_cell(cell, row, col, state)
    possible_cells = possible_cells_for_position(row, col, state)

    if cell == 'L'
      if occupied_adjacent_seats(possible_cells, state) == 0
        "#"
      else
        "L"
      end
    elsif cell == '#'
      if occupied_adjacent_seats(possible_cells, state) >= 5
        "L"
      else
        "#"
      end
    else
      "."
    end
  end

  private def occupied_adjacent_seats(possible_cells, state)
    total = 0
    possible_cells.each do |(row, col)|
      cell = state[row][col]

      next if cell == '.'

      total += 1 if cell == '#'
    end

    total
  end

  #       row|col
  NORTH      = [-1, 0]
  SOUTH      = [+1, 0]
  EAST       = [0, +1]
  WEST       = [0, -1]
  NORTH_WEST = [-1, -1]
  NORTH_EAST = [-1, +1]
  SOUTH_WEST = [+1, -1]
  SOUTH_EAST = [+1, +1]

  private def possible_cells_for_position(row, col, state)
    [
      possible_cell_for_position(row, col, NORTH, state),
      possible_cell_for_position(row, col, SOUTH, state),
      possible_cell_for_position(row, col, EAST, state),
      possible_cell_for_position(row, col, WEST, state),
      possible_cell_for_position(row, col, NORTH_WEST, state),
      possible_cell_for_position(row, col, NORTH_EAST, state),
      possible_cell_for_position(row, col, SOUTH_WEST, state),
      possible_cell_for_position(row, col, SOUTH_EAST, state),
    ].compact
  end

  private def possible_cell_for_position(row, col, direction, state)
    dx, dy = direction

    loop do
      new_row = row + dx
      new_col = col + dy

      break if new_row < 0 || new_row >= @n_rows
      break if new_col < 0 || new_col >= @n_cols

      new_cell = state[new_row][new_col]

      break [new_row, new_col] if new_cell == 'L' || new_cell == '#'

      row = new_row
      col = new_col
    end
  end
end
