class Day6Part1
  @filename : String

  def initialize(@filename); end

  def run!
    questions = Array(Array(String)).new
    current_group = nil

    File.read_lines(@filename).each do |line|
      if line == ""
        questions << current_group.not_nil!
        current_group = nil
      else
        current_group = current_group || Array(String).new
        current_group << line
      end
    end

    questions << current_group.not_nil!
    answer_count = 0

    questions.each do |group|
      answer_count += group.join.chars.uniq.size
    end

    answer_count
  end
end
