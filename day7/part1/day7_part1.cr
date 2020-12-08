require "string_scanner"

class BagDefinition
  @name : String
  @contains : Array(BagDefinition)?

  getter :contains, :name

  def initialize(@name, @contains); end
end

class Day7Part1
  @filename : String

  def initialize(@filename); end

  def run!
    bags = [] of BagDefinition
    File.read_lines(@filename).each do |line|
      matchdata = /(?<name>.*)\scontain\s(?<other_bags>.*)/.match(line)

      if matchdata
        if matchdata["other_bags"] == "no other bags."
          bags << BagDefinition.new(matchdata["name"].split(" ")[0..1].join(" "), nil)
        else
          this_bags_name = matchdata["name"].split(" ")[0..1].join(" ")
          s = StringScanner.new(matchdata["other_bags"])
          sub_bags = [] of BagDefinition

          loop do
            _number = s.scan(/\s?\d+/)

            s.scan(/\s/)

            name = s.scan(/\w+\s\w+\s\w+/).not_nil!.split(" ")[0..1].join(" ")

            sub_bags << BagDefinition.new(name, nil)

            comma_or_dot = s.scan(/./)

            if comma_or_dot == "." || s.eos?
              bags << BagDefinition.new(this_bags_name, sub_bags)
              break
            end
          end
        end
      else
        raise ArgumentError.new("#{line} didn't parse!")
      end
    end

    bags_that_can_hold_shiny_gold = 0

    bags.each do |bag_def|
      next if bag_def.name == "shiny gold"

      bag_def.contains && bag_def.contains.not_nil!.each do |sub_bag_def|
        if sub_bag_def.name == "shiny gold" || contains_gold?(bags, sub_bag_def.name)
          bags_that_can_hold_shiny_gold += 1
          break
        end
      end
    end

    bags_that_can_hold_shiny_gold
  end

  private def contains_gold?(bags, name)
    bags.each do |bag|
      next unless bag.name == name

      bag.contains && bag.contains.not_nil!.each do |sub_bag|
        return true if sub_bag.name == "shiny gold" || contains_gold?(bags, sub_bag.name)
      end
    end
  end
end
