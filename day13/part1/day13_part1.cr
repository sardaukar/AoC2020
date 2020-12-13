class Day13Part1
  @lines : Array(String)

  def initialize(filename)
    @lines = File.read_lines(filename)
  end

  def run!
    timestamp_estimate = @lines[0].to_i64
    bus_ids = (@lines[1].split(",").reject { |e| e == "x" }.map &.to_i64).sort

    next_bus_by_id = Hash(Int64, Int64).new

    bus_ids.each do |bus_id|
      next_time_for_bus_over_timestamp = 0.to_i64
      loop do
        next_time_for_bus_over_timestamp += bus_id

        if next_time_for_bus_over_timestamp >= timestamp_estimate
          next_bus_by_id[bus_id] = next_time_for_bus_over_timestamp
          break
        end
      end
    end

    next_best_bus_id = next_bus_by_id.min_by { |(k, v)| v }.first

    wait = next_bus_by_id[next_best_bus_id] - timestamp_estimate

    wait * next_best_bus_id
  end
end
