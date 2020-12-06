class Day6Part2
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
      group_answers = Hash(Char, Int32).new
      group.each do |answer|
        answer.chars.each do |answer_char|
          if group_answers.has_key?(answer_char)
            group_answers[answer_char] += 1
          else
            group_answers[answer_char] = 1
          end
        end
      end

      group_answers.each do |_, value|
        if value == group.size
          answer_count += 1
        end
      end
    end

    answer_count
  end
end
