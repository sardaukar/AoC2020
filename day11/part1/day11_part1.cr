class Day11Part1
  @filename : String

  def initialize(@filename); end

  def run!
    lines = File.read_lines(@filename)

    state = apply_rules(lines)

    loop do
      new_state = apply_rules(state)

      break if new_state == state

      state = new_state
    end

    # print_state(state)

    number_of_free_seats(state)
  end

  private def number_of_free_seats(state)
    total = 0

    state.each { |line| total += line.count("#") }

    total
  end

  private def print_state(state)
    state.each { |line| puts line }
  end

  private def apply_rules(lines)
    new_state = Array(String).new

    lines.each_with_index do |line, row|
      new_line = ""

      line.chars.each_with_index do |seat, col|
        new_line += new_state_for_cell(seat, row, col, lines)
      end

      new_state << new_line
    end

    new_state
  end

  private def new_state_for_cell(cell, row, col, lines)
    n_rows = lines.size
    n_cols = lines.first.size
    possible_cells = possible_cells_for_position(row, col, n_rows, n_cols)

    if cell == 'L'
      if occupied_adjacent_seats(possible_cells, lines) == 0
        "#"
      else
        "L"
      end
    elsif cell == '#'
      if occupied_adjacent_seats(possible_cells, lines) >= 4
        "L"
      else
        "#"
      end
    else
      "."
    end
  end

  private def occupied_adjacent_seats(possible_cells, lines)
    total = 0
    possible_cells.each do |(row, col)|
      cell = lines[row][col]

      next if cell == '.'

      total += 1 if cell == '#'
    end

    total
  end

  private def possible_cells_for_position(row, col, n_rows, n_cols)
    #
    # c-1 c c+1
    #  .  .  .  row -1
    #  .  x  .  row
    #  .  .  .  row +1
    #

    [
      [row - 1, col - 1],
      [row - 1, col],
      [row - 1, col + 1],
      [row, col - 1],
      [row, col + 1],
      [row + 1, col - 1],
      [row + 1, col],
      [row + 1, col + 1],
    ].map do |(pos_row, pos_col)|
      if (pos_col < 0 || pos_col >= n_cols) || (pos_row < 0 || pos_row >= n_rows)
        nil
      else
        [pos_row, pos_col]
      end
    end.compact
  end
end
