class Passport
  @byr : String?
  @iyr : String?
  @eyr : String?
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

class Day4Part1
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
            current_passport.not_nil!.byr = field_value
          when "iyr"
            current_passport.not_nil!.iyr = field_value
          when "eyr"
            current_passport.not_nil!.eyr = field_value
          when "hgt"
            current_passport.not_nil!.hgt = field_value
          when "hcl"
            current_passport.not_nil!.hcl = field_value
          when "ecl"
            current_passport.not_nil!.ecl = field_value
          when "pid"
            current_passport.not_nil!.pid = field_value
          when "cid"
            current_passport.not_nil!.cid = field_value
          else
            raise ArgumentError.new("unknown field #{field_name}")
          end
        end
      end
    end

    passports.size
  end
end
