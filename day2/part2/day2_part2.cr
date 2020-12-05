class PasswordEntry
  @rule : String
  @text : String

  def initialize(expression)
    @rule, @text = expression.split(": ")
  end

  def valid?
    match_data = /(?<idx1>\d+)-(?<idx2>\d+)\s(?<character>\w)/.match(@rule)

    idx1 = match_data.not_nil!.["idx1"].to_i
    idx2 = match_data.not_nil!.["idx2"].to_i
    character = match_data.not_nil!.["character"][0]

    @text[idx1 - 1] == character && @text[idx2 - 1] != character || @text[idx1 - 1] != character && @text[idx2 - 1] == character
  end
end

class Day2Part2
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
