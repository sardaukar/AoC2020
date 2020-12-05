class PasswordEntry
  @rule : String
  @text : String

  def initialize(expression)
    @rule, @text = expression.split(": ")
  end

  def valid?
    rule_amount, rule_character = @rule.split(" ")
    rule_min, rule_max = rule_amount.split("-")

    char_count = @text.count(rule_character)

    char_count >= rule_min.to_i && char_count <= rule_max.to_i
  end
end

class Day2Part1
  @filename : String

  def initialize(@filename); end

  def run!
    valid_entries = [] of PasswordEntry
    lines = File.read_lines(@filename)

    lines.each do |line|
      this_password_entry = PasswordEntry.new(line)

      valid_entries << this_password_entry if this_password_entry.valid?
    end

    valid_entries.size
  end
end
