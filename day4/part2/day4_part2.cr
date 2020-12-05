class Passport
  @byr : Int32?
  @iyr : Int32?
  @eyr : Int32?
  @hgt : String?
  @hcl : String?
  @ecl : String?
  @pid : String?
  @cid : String?

  property :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid

  def initialize
    @byr = nil
    @iyr = nil
    @eyr = nil
    @hgt = nil
    @hcl = nil
    @ecl = nil
    @pid = nil
    @cid = nil
  end

  def valid?
    @byr && @iyr && @eyr && @hgt && @hcl && @ecl && @pid
  end
end

class Day4Part2
  @filename : String

  def initialize(@filename); end

  def run!
    lines = File.read_lines(@filename)
    passports = [] of Passport
    current_passport = nil

    lines.each do |line|
      if line == ""
        passports << current_passport.not_nil! if current_passport.not_nil!.valid?
        current_passport = nil
      else
        current_passport = current_passport || Passport.new

        line.split(" ").each do |field|
          field_name, field_value = field.split(":")
          case field_name
          when "byr"
            current_passport.not_nil!.byr = add_byr(field_value)
          when "iyr"
            current_passport.not_nil!.iyr = add_iyr(field_value)
          when "eyr"
            current_passport.not_nil!.eyr = add_eyr(field_value)
          when "hgt"
            current_passport.not_nil!.hgt = add_hgt(field_value)
          when "hcl"
            current_passport.not_nil!.hcl = add_hcl(field_value)
          when "ecl"
            current_passport.not_nil!.ecl = add_ecl(field_value)
          when "pid"
            current_passport.not_nil!.pid = add_pid(field_value)
          when "cid"
            current_passport.not_nil!.cid = add_cid(field_value)
          else
            raise ArgumentError.new("unknown field #{field_name}")
          end
        end
      end
    end

    passports.size
  end

  private def add_cid(input)
    input
  end

  private def add_pid(input)
    return unless /\A\d{9}\z/ =~ input

    input
  end

  private def add_ecl(input)
    return unless %w[amb blu brn gry grn hzl oth].includes?(input)

    input
  end

  private def add_hcl(input)
    return unless /\A\#[0-9a-f]{6}\z/ =~ input

    input
  end

  private def add_hgt(input)
    matchdata = /(?<value>\d{1,3})(?<unit>in|cm)/.match(input)

    if matchdata
      value = matchdata["value"].to_i
      unit = matchdata["unit"]

      if unit == "cm"
        input if value >= 150 && value <= 193
      elsif unit == "in"
        input if value >= 59 && value <= 76
      else
        #
      end
    else
      #
    end
  end

  private def add_eyr(input)
    return unless input =~ /\A\d{4}\z/

    input = input.to_i

    input if input >= 2020 && input <= 2030
  end

  private def add_iyr(input)
    return unless input =~ /\A\d{4}\z/

    input = input.to_i

    input if input >= 2010 && input <= 2020
  end

  private def add_byr(input)
    return unless input =~ /\A\d{4}\z/

    input = input.to_i

    input if input >= 1920 && input <= 2002
  end
end
