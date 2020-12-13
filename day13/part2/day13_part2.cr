class Day13Part2
  @lines : Array(String)

  def initialize(filename)
    @lines = File.read_lines(filename)
  end

  def run!
    ids_and_rems =
      @lines[1]
        .split(",")
        .each_with_index
        .reject { |(id, _idx)| id == "x" }
        .map { |(id, idx)| [id.to_i64, idx] }
        .map { |(id, idx)| [(id - idx) % id, id] }
        .to_a
        .sort
        .reverse

    ids_and_rems.reduce { |x, y| sieve(x, y) }[0]
  end

  # https://en.wikipedia.org/wiki/Chinese_remainder_theorem#Search_by_sieving
  private def sieve(pair1, pair2)
    x1, n1 = pair1
    a2, n2 = pair2
    x = x1

    x2 = loop do
      break x if x % n2 == a2
      x += n1
    end

    [x2, n1 * n2]
  end
end
