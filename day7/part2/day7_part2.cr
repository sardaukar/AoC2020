require "string_scanner"

class BagDefinition
  @name : String
  @contains : Hash(String, Int32)?

  getter :contains, :name

  def initialize(@name, @contains); end
end

class Day7Part2
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
          sub_bags = Hash(String, Int32).new

          loop do
            number = s.scan(/\s?\d+/).not_nil!.to_i

            s.scan(/\s/)

            name = s.scan(/\w+\s\w+\s\w+/).not_nil!.split(" ")[0..1].join(" ")

            sub_bags[name] = number

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

    total_bags = 0
    bags.each do |bag_def|
      if bag_def.name == "shiny gold"
        bag_def.contains.not_nil!.each do |k, v|
          total_bags = v * get_total_bags(bags, k)
        end
      end
    end

    total_bags
  end

  private def get_total_bags(bags, name)
    this_bag = bags.find { |b| b.name == name }

    total_bags = 1

    this_bag && this_bag.not_nil!.contains && this_bag.contains.not_nil!.each do |contained_bag_name, contained_bag_amount|
      total_bags += contained_bag_amount * get_total_bags(bags, contained_bag_name)
    end

    total_bags
  end
end
